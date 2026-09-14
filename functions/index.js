const { setGlobalOptions } = require("firebase-functions");
const { initializeApp } = require("firebase-admin/app");
const logger = require("firebase-functions/logger");

setGlobalOptions({ maxInstances: 10 });
initializeApp();

const { onCall, HttpsError } = require("firebase-functions/v2/https");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const { GoogleGenerativeAI } = require("@google/generative-ai");

const GEMINI_MODEL = "gemini-3.6-flash";

exports.generateInterview = onCall(
  { secrets: ["GEMINI_API_KEY"], timeoutSeconds: 120 },
  async (request) => {
    const uid = request.auth?.uid;
    if (!uid) throw new HttpsError("unauthenticated", "Login required");

    const apiKey = process.env.GEMINI_API_KEY;
    if (!apiKey) {
      logger.error("GEMINI_API_KEY is missing or undefined in secrets");
      throw new HttpsError("internal", "GEMINI_API_KEY secret is not configured");
    }

    const {
      trackTitle,
      technologyTitle,
      experience,
      interviewType,
      difficulty,
      jobDescription,
    } = request.data;

    if (!trackTitle || !experience || !interviewType || !difficulty) {
      throw new HttpsError("invalid-argument", "Missing required config fields");
    }

    const genAI = new GoogleGenerativeAI(apiKey);
    const prompt = buildGenerationPrompt({
      trackTitle,
      technologyTitle,
      experience,
      interviewType,
      difficulty,
      jobDescription,
    });

    let parsed;
    try {
      parsed = await generateWithRetry(genAI, prompt);
    } catch (err) {
      logger.error("Gemini generation failed after retries:", err);
      throw new HttpsError("internal", `Failed to generate questions: ${err.message || err}`);
    }

    const questions = parsed.questions.map((q, i) => ({
      id: `q${i + 1}`,
      questionText: q.questionText,
      answerText: q.answerText,
    }));

    const db = getFirestore();
    const interviewRef = db.collection("users").doc(uid).collection("interviews").doc();

    await interviewRef.set({
      id: interviewRef.id,
      config: {
        trackTitle,
        technologyTitle,
        experience,
        interviewType,
        difficulty,
        jobDescription: jobDescription || null,
      },
      status: "inProgress",
      questions,
      createdAt: FieldValue.serverTimestamp(),
    });

    return { interviewId: interviewRef.id, questions };
  }
);

async function generateWithRetry(genAI, prompt, attempts = 2) {
  let lastErr;

  for (let i = 0; i < attempts; i++) {
    try {
      const model = genAI.getGenerativeModel({
        model: "gemini-3.6-flash",
        generationConfig: {
          responseMimeType: "application/json",
          temperature: 0.7,
        },
      });
      const result = await model.generateContent(prompt);
      const parsed = JSON.parse(result.response.text());
      if (Array.isArray(parsed.questions) && parsed.questions.length > 0) {
        return parsed;
      }
    } catch (err) {
      lastErr = err;
      logger.warn(`Attempt ${i + 1} failed: ${err.message || err}`);
      if (i < attempts - 1) {
        await new Promise((resolve) => setTimeout(resolve, 2000));
      }
    }
  }
  throw lastErr || new Error("Failed to generate valid interview questions");
}

function buildGenerationPrompt({ trackTitle, technologyTitle, experience, interviewType, difficulty, jobDescription }) {
  return `You are an expert technical interviewer creating interview questions.

Generate exactly 10 interview questions for a software engineering candidate with these parameters:
- Track: ${trackTitle}
${technologyTitle ? `- Technology: ${technologyTitle}` : ""}
- Experience level: ${experience}
- Difficulty: ${difficulty}
- Interview type: ${interviewType}
${jobDescription ? `- Tailor questions to this job description: ${jobDescription}` : ""}

Rules:
- Questions must be realistic, the kind a real interviewer would actually ask.
- Match difficulty and experience level precisely.
- If interview type is "mixed", blend technical and behavioral questions.
- If interview type is "rapidFire", make questions short and answerable in under 30 seconds.
- For each question, provide "answerText": a model answer (3-5 sentences) as if the interviewer is explaining it out loud after hearing the candidate's response.

Return ONLY valid JSON, no markdown:
{
  "questions": [
    { "questionText": "string", "answerText": "string" }
  ]
}`;
}