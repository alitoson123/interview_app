const { setGlobalOptions } = require("firebase-functions");
const { initializeApp, getApps } = require("firebase-admin/app");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const { onCall, HttpsError } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const { GoogleGenerativeAI } = require("@google/generative-ai");

if (getApps().length === 0) {
  initializeApp();
}

setGlobalOptions({ maxInstances: 10 });

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

function buildGenerationPrompt({
  trackTitle,
  technologyTitle,
  experience,
  interviewType,
  difficulty,
  jobDescription,
}) {
  return `You are a senior technical interviewer creating realistic interview questions and model answers for a software engineering candidate in the Arab tech market.

Interview Parameters:
- Track: ${trackTitle}
${technologyTitle ? `- Technology: ${technologyTitle}` : ""}
- Experience level: ${experience}
- Difficulty: ${difficulty}
- Interview type: ${interviewType}
${jobDescription ? `- Job Description: ${jobDescription}` : ""}

CRITICAL LANGUAGE & PHRASING REQUIREMENTS:
1. Mix Arabic and English Naturally (Tech Franco-Arab style):
   - The sentence structure, question framing, and explanations MUST be in natural, professional Arabic (Egyptian/Arab tech colloquial or modern style as spoken in real-world tech interviews).
   - ALL technical terms, framework concepts, programming keywords, design patterns, architecture names, API/library names, and tools MUST remain in English (e.g., "Stateful widget", "Stateless widget", "State Management", "Widget Lifecycle", "Dependency Injection", "Bloc", "Clean Architecture", "Garbage Collection", "Memory Leaks", "REST API", "CI/CD").
   
2. Question Examples (Follow this style):
   - "ايه الفرق بين الـ Stateful widget والـ Stateless widget في Flutter؟"
   - "ازاي بتعمل manage للـ State وبتتجنب الـ unnecessary rebuilds في الـ UI؟"
   - "لو التطبيق بيعاني من Memory Leak أو Jank أثناء الـ scrolling في List كبيرة، ايه الخطوات اللي بتتبعها للـ Debugging والـ Optimization؟"

3. Model Answer Requirements:
   - For each question, provide "answerText" (3-5 sentences) in the exact same natural Arabic mixed with English technical terms.
   - The model answer should sound like a senior interviewer or tech lead explaining the ideal, correct answer out loud.

4. Content & Difficulty Rules:
   - Generate exactly 10 questions.
   - Questions must match the ${difficulty} difficulty and ${experience} experience level accurately.
   - If interview type is "mixed", combine core technical questions with behavioral/scenario questions (also framed in natural mixed Arabic/English).
   - If interview type is "rapidFire", make questions concise and direct.

Return ONLY valid JSON matching this schema, with no markdown codeblocks:
{
  "questions": [
    { "questionText": "string", "answerText": "string" }
  ]
}`;
}