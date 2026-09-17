// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(days) => "${days}-day streak";

  static String m1(current, total) => "Question ${current} of ${total}";

  static String m2(answered, total) => "${answered} of ${total} Questions";

  static String m3(total) => "${total} Questions";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Email_has_been_sent_successfully":
            MessageLookupByLibrary.simpleMessage(
                "Email has been sent successfully"),
        "accountSection":
            MessageLookupByLibrary.simpleMessage("ACCOUNT & DATA"),
        "achievements": MessageLookupByLibrary.simpleMessage("Achievements"),
        "activeCandidate":
            MessageLookupByLibrary.simpleMessage("Active Candidate"),
        "aiParsed": MessageLookupByLibrary.simpleMessage("AI parsed ✓"),
        "aiVoice": MessageLookupByLibrary.simpleMessage("AI Voice"),
        "appSettings": MessageLookupByLibrary.simpleMessage("App Settings"),
        "appVersion": MessageLookupByLibrary.simpleMessage("App Version"),
        "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic (العربية)"),
        "autoStopDelay":
            MessageLookupByLibrary.simpleMessage("Auto-stop Silence Delay"),
        "avgScore": MessageLookupByLibrary.simpleMessage("AVG. SCORE"),
        "backToHome": MessageLookupByLibrary.simpleMessage("Back to Home"),
        "calibrateExpectation": MessageLookupByLibrary.simpleMessage(
            "We\'ll calibrate expectations, not difficulty."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "chars": MessageLookupByLibrary.simpleMessage("chars"),
        "chooseExperience": MessageLookupByLibrary.simpleMessage(
            "Choose your experience level."),
        "chooseLanguage":
            MessageLookupByLibrary.simpleMessage("Choose Language"),
        "chooseTechnology": MessageLookupByLibrary.simpleMessage(
            "Choose your preferred technology."),
        "chooseTheme": MessageLookupByLibrary.simpleMessage("Choose Theme"),
        "chooseTrackDomain": MessageLookupByLibrary.simpleMessage(
            "Choose the interview domain."),
        "chooseVoice": MessageLookupByLibrary.simpleMessage("Choose AI Voice"),
        "choose_interview_track":
            MessageLookupByLibrary.simpleMessage("Choose Interview Track"),
        "clearCache":
            MessageLookupByLibrary.simpleMessage("Clear Offline Sessions"),
        "clearCacheSuccess":
            MessageLookupByLibrary.simpleMessage("Cache cleared successfully"),
        "completionRate": MessageLookupByLibrary.simpleMessage("Completion"),
        "continueInterview":
            MessageLookupByLibrary.simpleMessage("Continue Interview"),
        "continue_btn": MessageLookupByLibrary.simpleMessage("Continue"),
        "continue_where_you_left_off":
            MessageLookupByLibrary.simpleMessage("CONTINUE WHERE YOU LEFT OFF"),
        "continue_with_apple":
            MessageLookupByLibrary.simpleMessage("Continue with Apple"),
        "continue_with_google":
            MessageLookupByLibrary.simpleMessage("Continue with Google"),
        "continuee": MessageLookupByLibrary.simpleMessage("Continue"),
        "create_account":
            MessageLookupByLibrary.simpleMessage("Create account"),
        "create_account_and_start_practicing":
            MessageLookupByLibrary.simpleMessage(
                "Create your account and start practicing."),
        "dayStreak": m0,
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
        "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to permanently delete your account? All your data and progress will be lost."),
        "deleteInterview":
            MessageLookupByLibrary.simpleMessage("Delete Interview"),
        "deleteInterviewConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this interview record?"),
        "desc_algorithms":
            MessageLookupByLibrary.simpleMessage("DS, complexity"),
        "desc_backend":
            MessageLookupByLibrary.simpleMessage("APIs, databases, ..."),
        "desc_flutter":
            MessageLookupByLibrary.simpleMessage("Widgets, state, as..."),
        "desc_frontend":
            MessageLookupByLibrary.simpleMessage("DOM, CSS, perfor..."),
        "desc_hr": MessageLookupByLibrary.simpleMessage("Behavioral, culture"),
        "desc_nodejs":
            MessageLookupByLibrary.simpleMessage("Event loop, strea..."),
        "desc_oop": MessageLookupByLibrary.simpleMessage("Design, patterns"),
        "desc_react":
            MessageLookupByLibrary.simpleMessage("Hooks, rendering, ..."),
        "desc_solid":
            MessageLookupByLibrary.simpleMessage("Principles, clean ..."),
        "desc_system_design":
            MessageLookupByLibrary.simpleMessage("Scale, tradeoffs"),
        "difficultyEasy": MessageLookupByLibrary.simpleMessage("Easy"),
        "difficultyEasySub":
            MessageLookupByLibrary.simpleMessage("Warm-up · concept checks"),
        "difficultyHard": MessageLookupByLibrary.simpleMessage("Hard"),
        "difficultyHardSub": MessageLookupByLibrary.simpleMessage(
            "FAANG-tier · deep follow-ups"),
        "difficultyMedium": MessageLookupByLibrary.simpleMessage("Medium"),
        "difficultyMediumSub":
            MessageLookupByLibrary.simpleMessage("Realistic on-site pace"),
        "difficultyScreen":
            MessageLookupByLibrary.simpleMessage("Difficulty Level"),
        "difficultyTipMessage": MessageLookupByLibrary.simpleMessage(
            "Try Junior + Hard for stretch practice, or Senior + Easy for a fluency drill."),
        "email_address": MessageLookupByLibrary.simpleMessage("Email address"),
        "email_not_verified":
            MessageLookupByLibrary.simpleMessage("Email not verified"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "exitInterview": MessageLookupByLibrary.simpleMessage("Exit Interview"),
        "exitInterviewConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to exit? Your current progress will be lost."),
        "experienceBeginner": MessageLookupByLibrary.simpleMessage("Beginner"),
        "experienceBeginnerSub":
            MessageLookupByLibrary.simpleMessage("0–1 years · fundamentals"),
        "experienceJunior": MessageLookupByLibrary.simpleMessage("Junior"),
        "experienceJuniorSub": MessageLookupByLibrary.simpleMessage(
            "1–3 years · shipping features"),
        "experienceLevel":
            MessageLookupByLibrary.simpleMessage("Experience Level"),
        "experienceMid": MessageLookupByLibrary.simpleMessage("Mid-Level"),
        "experienceMidSub":
            MessageLookupByLibrary.simpleMessage("3–5 years · owns modules"),
        "experienceSenior": MessageLookupByLibrary.simpleMessage("Senior"),
        "experienceSeniorSub": MessageLookupByLibrary.simpleMessage(
            "5+ years · leads architecture"),
        "fastThinker": MessageLookupByLibrary.simpleMessage("Fast thinker"),
        "favTrack": MessageLookupByLibrary.simpleMessage("FAV. TRACK"),
        "filterAll": MessageLookupByLibrary.simpleMessage("All"),
        "filterCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
        "filterInProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
        "finishInterview":
            MessageLookupByLibrary.simpleMessage("Complete Interview"),
        "firstInterviewBadge":
            MessageLookupByLibrary.simpleMessage("First Step"),
        "forget_password":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forget_password_subtitle": MessageLookupByLibrary.simpleMessage(
            "Enter your email address and we\'ll send you a link to reset your password."),
        "full_name": MessageLookupByLibrary.simpleMessage("Full name"),
        "generatingQuestions": MessageLookupByLibrary.simpleMessage(
            "Alex is crafting your interview..."),
        "generatingQuestionsSub": MessageLookupByLibrary.simpleMessage(
            "Generating 10 tailored questions based on your profile"),
        "good_morning": MessageLookupByLibrary.simpleMessage("Good morning"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got it"),
        "helpCenter": MessageLookupByLibrary.simpleMessage("Help & FAQ"),
        "historyTitle":
            MessageLookupByLibrary.simpleMessage("Interview History"),
        "independentOfExperience": MessageLookupByLibrary.simpleMessage(
            "Independent of experience — challenge yourself."),
        "interviewCompleted":
            MessageLookupByLibrary.simpleMessage("Interview Completed!"),
        "interviewCompletedSub": MessageLookupByLibrary.simpleMessage(
            "Great job completing your interview session."),
        "interviewDetails":
            MessageLookupByLibrary.simpleMessage("Interview Details"),
        "interviewExperienceSection":
            MessageLookupByLibrary.simpleMessage("AI & INTERVIEW"),
        "interviewType": MessageLookupByLibrary.simpleMessage("Interview type"),
        "interviewTypeHR": MessageLookupByLibrary.simpleMessage("HR"),
        "interviewTypeHRSub":
            MessageLookupByLibrary.simpleMessage("Behavioral & culture-fit"),
        "interviewTypeMixed": MessageLookupByLibrary.simpleMessage("Mixed"),
        "interviewTypeMixedSub": MessageLookupByLibrary.simpleMessage(
            "Balanced technical + behavioral"),
        "interviewTypeRapidFire":
            MessageLookupByLibrary.simpleMessage("Rapid Fire"),
        "interviewTypeRapidFireSub": MessageLookupByLibrary.simpleMessage(
            "30s per question · pressure test"),
        "interviewTypeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Format your session end-to-end."),
        "interviewTypeTechnical":
            MessageLookupByLibrary.simpleMessage("Technical"),
        "interviewTypeTechnicalSub": MessageLookupByLibrary.simpleMessage(
            "Deep-dive on stack knowledge"),
        "interviewerName":
            MessageLookupByLibrary.simpleMessage("Alex · AI Interviewer"),
        "interviewerRole":
            MessageLookupByLibrary.simpleMessage("Technical Lead"),
        "interviewsCount": MessageLookupByLibrary.simpleMessage("INTERVIEWS"),
        "job_role_title": MessageLookupByLibrary.simpleMessage("Job Role"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "listening": MessageLookupByLibrary.simpleMessage("Listening..."),
        "listeningHint": MessageLookupByLibrary.simpleMessage(
            "Speak clearly. Tap the mic when finished."),
        "loading": MessageLookupByLibrary.simpleMessage("loading..."),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "logOutConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out of your account?"),
        "login_subtitle": MessageLookupByLibrary.simpleMessage(
            "Welcome back. Let\'s get you interview-ready."),
        "login_success":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "modelAnswer":
            MessageLookupByLibrary.simpleMessage("Interviewer\'s Model Answer"),
        "myResumeAndRole":
            MessageLookupByLibrary.simpleMessage("My Resume & Target Role"),
        "nav_history": MessageLookupByLibrary.simpleMessage("History"),
        "nav_home": MessageLookupByLibrary.simpleMessage("Home"),
        "nav_profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "nav_stats": MessageLookupByLibrary.simpleMessage("Stats"),
        "nextQuestion": MessageLookupByLibrary.simpleMessage("Next Question"),
        "noAnswerProvided": MessageLookupByLibrary.simpleMessage(
            "No answer provided (Skipped)"),
        "noHistoryFound":
            MessageLookupByLibrary.simpleMessage("No interviews found"),
        "noHistoryFoundSub": MessageLookupByLibrary.simpleMessage(
            "Start your first interview to track your progress here."),
        "noStatsYet": MessageLookupByLibrary.simpleMessage("N/A"),
        "notProvided": MessageLookupByLibrary.simpleMessage("Not provided"),
        "ok": MessageLookupByLibrary.simpleMessage("Got it"),
        "optionalTailor": MessageLookupByLibrary.simpleMessage(
            "Optional · we\'ll tailor questions to the role."),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "or_continue_with":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_reset_email_sent":
            MessageLookupByLibrary.simpleMessage("Password reset email sent"),
        "pasteJobDescription":
            MessageLookupByLibrary.simpleMessage("Paste the job description"),
        "pasteJobDescriptionHint":
            MessageLookupByLibrary.simpleMessage("Paste job description here…"),
        "pauseSession": MessageLookupByLibrary.simpleMessage("Pause"),
        "pickADifficulty":
            MessageLookupByLibrary.simpleMessage("Pick a difficulty"),
        "please_enter_email":
            MessageLookupByLibrary.simpleMessage("Please enter your email"),
        "please_enter_password":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "please_enter_your_name":
            MessageLookupByLibrary.simpleMessage("Please enter your name"),
        "practiceAgain": MessageLookupByLibrary.simpleMessage("Practice Again"),
        "preferencesSection":
            MessageLookupByLibrary.simpleMessage("PREFERENCES"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profileTitle": MessageLookupByLibrary.simpleMessage("Profile"),
        "questionOf": m1,
        "question_8_of_12_mid_level": MessageLookupByLibrary.simpleMessage(
            "Question 8 of 12 • Mid level"),
        "questionsAnswered": MessageLookupByLibrary.simpleMessage("Answered"),
        "questionsCount": m2,
        "questionsCountCompleted": m3,
        "react_technical":
            MessageLookupByLibrary.simpleMessage("React - Technical"),
        "readinessScore": MessageLookupByLibrary.simpleMessage("85% Readiness"),
        "readyToStart": MessageLookupByLibrary.simpleMessage("Ready to start?"),
        "replayQuestion": MessageLookupByLibrary.simpleMessage("Replay"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resume": MessageLookupByLibrary.simpleMessage("Resume"),
        "reviewAnswers":
            MessageLookupByLibrary.simpleMessage("Review All Questions"),
        "reviewDifficulty": MessageLookupByLibrary.simpleMessage("DIFFICULTY"),
        "reviewExperience": MessageLookupByLibrary.simpleMessage("EXPERIENCE"),
        "reviewJobDescription":
            MessageLookupByLibrary.simpleMessage("JOB DESCRIPTION"),
        "reviewSessionSubtitle": MessageLookupByLibrary.simpleMessage(
            "Review your session — you can pause anytime."),
        "reviewTrack": MessageLookupByLibrary.simpleMessage("TRACK"),
        "reviewType": MessageLookupByLibrary.simpleMessage("TYPE"),
        "role_android":
            MessageLookupByLibrary.simpleMessage("Android Developer"),
        "role_backend":
            MessageLookupByLibrary.simpleMessage("Backend Developer"),
        "role_data": MessageLookupByLibrary.simpleMessage("Data Engineer"),
        "role_devops": MessageLookupByLibrary.simpleMessage("DevOps Engineer"),
        "role_flutter":
            MessageLookupByLibrary.simpleMessage("Flutter Developer"),
        "role_frontend":
            MessageLookupByLibrary.simpleMessage("Frontend Developer"),
        "role_fullstack":
            MessageLookupByLibrary.simpleMessage("Full Stack Developer"),
        "role_ios": MessageLookupByLibrary.simpleMessage("iOS Developer"),
        "see_all": MessageLookupByLibrary.simpleMessage("See all"),
        "send_again": MessageLookupByLibrary.simpleMessage("Send Again"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signing_in": MessageLookupByLibrary.simpleMessage("signing in"),
        "signing_up": MessageLookupByLibrary.simpleMessage("signing up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "skipQuestion": MessageLookupByLibrary.simpleMessage("Skip Question"),
        "skipped": MessageLookupByLibrary.simpleMessage("Skipped"),
        "speaking": MessageLookupByLibrary.simpleMessage("Speaking..."),
        "speechSensitivity":
            MessageLookupByLibrary.simpleMessage("Microphone Sensitivity"),
        "startInterview":
            MessageLookupByLibrary.simpleMessage("Start Interview"),
        "step1of6": MessageLookupByLibrary.simpleMessage("Step 1 of 6"),
        "step2of6": MessageLookupByLibrary.simpleMessage("Step 2 of 6"),
        "step3of6": MessageLookupByLibrary.simpleMessage("Step 3 of 6"),
        "step4of6": MessageLookupByLibrary.simpleMessage("Step 4 of 6"),
        "step5of6": MessageLookupByLibrary.simpleMessage("Step 5 of 6"),
        "step6of6": MessageLookupByLibrary.simpleMessage("Step 6 of 6"),
        "step_1_of_5": MessageLookupByLibrary.simpleMessage("Step 1 of 5"),
        "submitAnswer": MessageLookupByLibrary.simpleMessage("Submit Answer"),
        "supportSection":
            MessageLookupByLibrary.simpleMessage("SUPPORT & ABOUT"),
        "switchToText":
            MessageLookupByLibrary.simpleMessage("Switch to typing"),
        "switchToVoice":
            MessageLookupByLibrary.simpleMessage("Switch to voice"),
        "tapToSpeak":
            MessageLookupByLibrary.simpleMessage("Tap to speak your answer"),
        "tapToStop":
            MessageLookupByLibrary.simpleMessage("Tap to stop recording"),
        "targetRoleHint": MessageLookupByLibrary.simpleMessage("Target Role"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Light Mode"),
        "themeSystem": MessageLookupByLibrary.simpleMessage("System Default"),
        "timeSpent": MessageLookupByLibrary.simpleMessage("Time Spent"),
        "tip": MessageLookupByLibrary.simpleMessage("Tip. "),
        "topPerformer": MessageLookupByLibrary.simpleMessage("Top Performer"),
        "trackMaster": MessageLookupByLibrary.simpleMessage("Track Master"),
        "trackSelection":
            MessageLookupByLibrary.simpleMessage("Track Selection"),
        "track_algorithms": MessageLookupByLibrary.simpleMessage("Algorithms"),
        "track_backend": MessageLookupByLibrary.simpleMessage("Backend"),
        "track_flutter": MessageLookupByLibrary.simpleMessage("Flutter"),
        "track_frontend": MessageLookupByLibrary.simpleMessage("Frontend"),
        "track_hr": MessageLookupByLibrary.simpleMessage("HR"),
        "track_nodejs": MessageLookupByLibrary.simpleMessage("Node.js"),
        "track_oop": MessageLookupByLibrary.simpleMessage("OOP"),
        "track_react": MessageLookupByLibrary.simpleMessage("React"),
        "track_solid": MessageLookupByLibrary.simpleMessage("SOLID"),
        "track_system_design":
            MessageLookupByLibrary.simpleMessage("System Design"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "typeYourAnswer":
            MessageLookupByLibrary.simpleMessage("Type your answer here..."),
        "uploadPdfResumeJD":
            MessageLookupByLibrary.simpleMessage("Upload PDF Resume / JD"),
        "verify_email_then_login": MessageLookupByLibrary.simpleMessage(
            "Verify your email then login"),
        "voiceAlex":
            MessageLookupByLibrary.simpleMessage("Alex (Technical Lead)"),
        "voiceSarah":
            MessageLookupByLibrary.simpleMessage("Sarah (HR Specialist)"),
        "what_are_you_interviewing_for": MessageLookupByLibrary.simpleMessage(
            "What are you interviewing for?"),
        "yourAnswer": MessageLookupByLibrary.simpleMessage("Your Response")
      };
}
