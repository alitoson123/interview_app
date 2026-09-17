// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(days) => "سلسلة ${days} أيام";

  static String m1(current, total) => "السؤال ${current} من ${total}";

  static String m2(answered, total) => "${answered} من أصل ${total} أسئلة";

  static String m3(total) => "${total} أسئلة";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Email_has_been_sent_successfully":
            MessageLookupByLibrary.simpleMessage(
                "تم إرسال البريد الإلكتروني بنجاح"),
        "accountSection":
            MessageLookupByLibrary.simpleMessage("الحساب والبيانات"),
        "achievements": MessageLookupByLibrary.simpleMessage("الإنجازات"),
        "activeCandidate": MessageLookupByLibrary.simpleMessage("مرشح نشط"),
        "aiParsed":
            MessageLookupByLibrary.simpleMessage("تم تحليل الذكاء الاصطناعي ✓"),
        "aiVoice": MessageLookupByLibrary.simpleMessage("صوت الذكاء الاصطناعي"),
        "appSettings": MessageLookupByLibrary.simpleMessage("إعدادات التطبيق"),
        "appVersion": MessageLookupByLibrary.simpleMessage("إصدار التطبيق"),
        "appearance": MessageLookupByLibrary.simpleMessage("المظهر"),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "autoStopDelay":
            MessageLookupByLibrary.simpleMessage("إيقاف التسجيل عند الصمت"),
        "avgScore": MessageLookupByLibrary.simpleMessage("متوسط النتيجة"),
        "backToHome": MessageLookupByLibrary.simpleMessage("العودة للرئيسية"),
        "calibrateExpectation": MessageLookupByLibrary.simpleMessage(
            "سنقوم بمعايرة التوقعات، وليس الصعوبة."),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "chars": MessageLookupByLibrary.simpleMessage("حرف"),
        "chooseExperience":
            MessageLookupByLibrary.simpleMessage("اختر مستوى الخبرة."),
        "chooseLanguage": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
        "chooseTechnology":
            MessageLookupByLibrary.simpleMessage("اختر التقنية المفضلة لديك."),
        "chooseTheme": MessageLookupByLibrary.simpleMessage("اختر المظهر"),
        "chooseTrackDomain":
            MessageLookupByLibrary.simpleMessage("اختر مجال المقابلة."),
        "chooseVoice": MessageLookupByLibrary.simpleMessage("اختر صوت المحاور"),
        "choose_interview_track":
            MessageLookupByLibrary.simpleMessage("اختر مسار المقابلة"),
        "clearCache":
            MessageLookupByLibrary.simpleMessage("مسح الجلسات المحفوظة"),
        "clearCacheSuccess":
            MessageLookupByLibrary.simpleMessage("تم مسح البيانات بنجاح"),
        "completionRate": MessageLookupByLibrary.simpleMessage("نسبة الإكمال"),
        "continueInterview":
            MessageLookupByLibrary.simpleMessage("متابعة المقابلة"),
        "continue_btn": MessageLookupByLibrary.simpleMessage("متابعة"),
        "continue_where_you_left_off":
            MessageLookupByLibrary.simpleMessage("المتابعة من حيث توقفت"),
        "continue_with_apple":
            MessageLookupByLibrary.simpleMessage("متابعة باستخدام Apple"),
        "continue_with_google":
            MessageLookupByLibrary.simpleMessage("متابعة باستخدام جوجل"),
        "continuee": MessageLookupByLibrary.simpleMessage("متابعة"),
        "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "create_account_and_start_practicing":
            MessageLookupByLibrary.simpleMessage("أنشئ حسابك وابدأ التدريب"),
        "dayStreak": m0,
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من رغبتك في حذف حسابك نهائياً؟ سيتم مسح كافة بياناتك وتقدمك."),
        "deleteInterview": MessageLookupByLibrary.simpleMessage("حذف المقابلة"),
        "deleteInterviewConfirm": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من حذف سجل هذه المقابلة؟"),
        "desc_algorithms":
            MessageLookupByLibrary.simpleMessage("بيانات، تعقيد"),
        "desc_backend":
            MessageLookupByLibrary.simpleMessage("واجهات، قواعد بيانات..."),
        "desc_flutter": MessageLookupByLibrary.simpleMessage("ودجات، حالة..."),
        "desc_frontend":
            MessageLookupByLibrary.simpleMessage("DOM, CSS, أداء..."),
        "desc_hr": MessageLookupByLibrary.simpleMessage("سلوكيات، ثقافة"),
        "desc_nodejs":
            MessageLookupByLibrary.simpleMessage("Event loop, stream..."),
        "desc_oop": MessageLookupByLibrary.simpleMessage("تصميم، أنماط"),
        "desc_react":
            MessageLookupByLibrary.simpleMessage("Hooks, rendering..."),
        "desc_solid": MessageLookupByLibrary.simpleMessage("مبادئ، كود نظيف"),
        "desc_system_design":
            MessageLookupByLibrary.simpleMessage("توسع، مقايضات"),
        "difficultyEasy": MessageLookupByLibrary.simpleMessage("سهل"),
        "difficultyEasySub":
            MessageLookupByLibrary.simpleMessage("إحماء · مراجعة المفاهيم"),
        "difficultyHard": MessageLookupByLibrary.simpleMessage("صعب"),
        "difficultyHardSub":
            MessageLookupByLibrary.simpleMessage("مستوى FAANG · متابعات عميقة"),
        "difficultyMedium": MessageLookupByLibrary.simpleMessage("متوسط"),
        "difficultyMediumSub":
            MessageLookupByLibrary.simpleMessage("سرعة واقعية"),
        "difficultyScreen":
            MessageLookupByLibrary.simpleMessage("مستوى الصعوبة"),
        "difficultyTipMessage": MessageLookupByLibrary.simpleMessage(
            "جرب Junior + Hard للتدريب المتقدم، أو Senior + Easy لاختبار الطلاقة."),
        "email_address":
            MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
        "email_not_verified":
            MessageLookupByLibrary.simpleMessage("البريد الالكتروني غير مفعل"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "exit": MessageLookupByLibrary.simpleMessage("خروج"),
        "exitInterview":
            MessageLookupByLibrary.simpleMessage("الخروج من المقابلة"),
        "exitInterviewConfirm": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من الخروج؟ سيتم فقدان تقدمك الحالي."),
        "experienceBeginner": MessageLookupByLibrary.simpleMessage("مبتدئ"),
        "experienceBeginnerSub":
            MessageLookupByLibrary.simpleMessage("0-1 سنة · الأساسيات"),
        "experienceJunior": MessageLookupByLibrary.simpleMessage("مبتدئ متقدم"),
        "experienceJuniorSub":
            MessageLookupByLibrary.simpleMessage("1-3 سنوات · شحن الميزات"),
        "experienceLevel": MessageLookupByLibrary.simpleMessage("مستوى الخبرة"),
        "experienceMid": MessageLookupByLibrary.simpleMessage("متوسط"),
        "experienceMidSub":
            MessageLookupByLibrary.simpleMessage("3-5 سنوات · يمتلك وحدات"),
        "experienceSenior": MessageLookupByLibrary.simpleMessage("خبير"),
        "experienceSeniorSub":
            MessageLookupByLibrary.simpleMessage("5+ سنوات · يقود البنية"),
        "fastThinker": MessageLookupByLibrary.simpleMessage("سريع البديهة"),
        "favTrack": MessageLookupByLibrary.simpleMessage("المسار المفضل"),
        "filterAll": MessageLookupByLibrary.simpleMessage("الكل"),
        "filterCompleted": MessageLookupByLibrary.simpleMessage("مكتمل"),
        "filterInProgress": MessageLookupByLibrary.simpleMessage("قيد التقدم"),
        "finishInterview":
            MessageLookupByLibrary.simpleMessage("إنهاء المقابلة"),
        "firstInterviewBadge":
            MessageLookupByLibrary.simpleMessage("الخطوة الأولى"),
        "forget_password":
            MessageLookupByLibrary.simpleMessage("هل نسيت كلمة المرور؟"),
        "forget_password_subtitle": MessageLookupByLibrary.simpleMessage(
            "أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور."),
        "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
        "generatingQuestions": MessageLookupByLibrary.simpleMessage(
            "أليكس يقوم بإعداد مقابلتك الآن..."),
        "generatingQuestionsSub": MessageLookupByLibrary.simpleMessage(
            "جاري إنشاء 10 أسئلة مخصصة لمستواك ومسارك"),
        "good_morning": MessageLookupByLibrary.simpleMessage("صباح الخير"),
        "gotIt": MessageLookupByLibrary.simpleMessage("حسناً"),
        "helpCenter": MessageLookupByLibrary.simpleMessage(
            "مركز المساعدة والأسئلة الشائعة"),
        "historyTitle": MessageLookupByLibrary.simpleMessage("سجل المقابلات"),
        "interviewCompleted":
            MessageLookupByLibrary.simpleMessage("اكتملت المقابلة!"),
        "interviewCompletedSub": MessageLookupByLibrary.simpleMessage(
            "عمل رائع في إكمال جلسة المقابلة."),
        "interviewDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل المقابلة"),
        "interviewExperienceSection":
            MessageLookupByLibrary.simpleMessage("الذكاء الاصطناعي والمقابلة"),
        "interviewType": MessageLookupByLibrary.simpleMessage("نوع المقابلة"),
        "interviewTypeHR":
            MessageLookupByLibrary.simpleMessage("الموارد البشرية"),
        "interviewTypeHRSub": MessageLookupByLibrary.simpleMessage(
            "السلوكيات والملاءمة الثقافية"),
        "interviewTypeMixed": MessageLookupByLibrary.simpleMessage("مختلط"),
        "interviewTypeMixedSub":
            MessageLookupByLibrary.simpleMessage("متوازن تقني + سلوكي"),
        "interviewTypeRapidFire":
            MessageLookupByLibrary.simpleMessage("إطلاق سريع"),
        "interviewTypeRapidFireSub": MessageLookupByLibrary.simpleMessage(
            "30 ثانية لكل سؤال · اختبار ضغط"),
        "interviewTypeSubtitle": MessageLookupByLibrary.simpleMessage(
            "قم بتنسيق جلستك من البداية إلى النهاية."),
        "interviewTypeTechnical": MessageLookupByLibrary.simpleMessage("تقني"),
        "interviewTypeTechnicalSub":
            MessageLookupByLibrary.simpleMessage("تعمق في المعرفة التقنية"),
        "interviewerName": MessageLookupByLibrary.simpleMessage(
            "أليكس · محاور الذكاء الاصطناعي"),
        "interviewerRole":
            MessageLookupByLibrary.simpleMessage("القائد التقني"),
        "interviewsCount": MessageLookupByLibrary.simpleMessage("المقابلات"),
        "job_role_title":
            MessageLookupByLibrary.simpleMessage("المسمى الوظيفي"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "listening": MessageLookupByLibrary.simpleMessage("يستمع الآن..."),
        "listeningHint": MessageLookupByLibrary.simpleMessage(
            "تحدث بوضوح. اضغط على الميكروفون عند الانتهاء."),
        "loading": MessageLookupByLibrary.simpleMessage("جاري التحميل..."),
        "logIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logOut": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "logOutConfirm": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من تسجيل الخروج من حسابك؟"),
        "login_subtitle": MessageLookupByLibrary.simpleMessage(
            "مرحبا بك مجددا. لنستعد للمقابلة"),
        "login_success":
            MessageLookupByLibrary.simpleMessage("تم تسجيل الدخول بنجاح"),
        "modelAnswer": MessageLookupByLibrary.simpleMessage(
            "الإجابة النموذجية من المحاور"),
        "myResumeAndRole": MessageLookupByLibrary.simpleMessage(
            "سيرتي الذاتية والمسمى المستهدف"),
        "nav_history": MessageLookupByLibrary.simpleMessage("السجل"),
        "nav_home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "nav_profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "nav_stats": MessageLookupByLibrary.simpleMessage("الإحصائيات"),
        "nextQuestion": MessageLookupByLibrary.simpleMessage("السؤال التالي"),
        "noAnswerProvided": MessageLookupByLibrary.simpleMessage(
            "لم يتم تقديم إجابة (تم التخطي)"),
        "noHistoryFound":
            MessageLookupByLibrary.simpleMessage("لا توجد مقابلات سابقة"),
        "noHistoryFoundSub": MessageLookupByLibrary.simpleMessage(
            "ابدأ مقابلتك الأولى لتتبع تقدمك هنا."),
        "noStatsYet": MessageLookupByLibrary.simpleMessage("لا يوجد"),
        "notProvided": MessageLookupByLibrary.simpleMessage("غير متوفر"),
        "ok": MessageLookupByLibrary.simpleMessage("حسناً"),
        "optionalTailor": MessageLookupByLibrary.simpleMessage(
            "اختياري · سنقوم بتخصيص الأسئلة لتناسب الدور."),
        "or": MessageLookupByLibrary.simpleMessage("أو"),
        "or_continue_with":
            MessageLookupByLibrary.simpleMessage("أو متابعة باستخدام"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "password_reset_email_sent": MessageLookupByLibrary.simpleMessage(
            "تم إرسال بريد إلكتروني لإعادة تعيين كلمة المرور"),
        "pasteJobDescription":
            MessageLookupByLibrary.simpleMessage("الصق الوصف الوظيفي"),
        "pasteJobDescriptionHint":
            MessageLookupByLibrary.simpleMessage("الصق الوصف الوظيفي هنا…"),
        "pauseSession": MessageLookupByLibrary.simpleMessage("إيقاف مؤقت"),
        "please_enter_email": MessageLookupByLibrary.simpleMessage(
            "الرجاء إدخال بريدك الإلكتروني"),
        "please_enter_password":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال كلمة المرور"),
        "please_enter_your_name":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال اسمك"),
        "practiceAgain":
            MessageLookupByLibrary.simpleMessage("التدرب مرة أخرى"),
        "preferencesSection": MessageLookupByLibrary.simpleMessage("التفضيلات"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
        "profileTitle": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "questionOf": m1,
        "question_8_of_12_mid_level": MessageLookupByLibrary.simpleMessage(
            "السؤال 8 من 12 • مستوى متوسط"),
        "questionsAnswered":
            MessageLookupByLibrary.simpleMessage("تمت الإجابة"),
        "questionsCount": m2,
        "questionsCountCompleted": m3,
        "react_technical": MessageLookupByLibrary.simpleMessage("React - تقني"),
        "readinessScore": MessageLookupByLibrary.simpleMessage("جاهزية 85%"),
        "readyToStart":
            MessageLookupByLibrary.simpleMessage("هل أنت مستعد للبدء؟"),
        "replayQuestion":
            MessageLookupByLibrary.simpleMessage("إعادة الاستماع"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("إعادة تعيين كلمة المرور"),
        "resume": MessageLookupByLibrary.simpleMessage("متابعة"),
        "reviewAnswers":
            MessageLookupByLibrary.simpleMessage("مراجعة جميع الأسئلة"),
        "reviewDifficulty": MessageLookupByLibrary.simpleMessage("الصعوبة"),
        "reviewExperience": MessageLookupByLibrary.simpleMessage("الخبرة"),
        "reviewJobDescription":
            MessageLookupByLibrary.simpleMessage("الوصف الوظيفي"),
        "reviewSessionSubtitle": MessageLookupByLibrary.simpleMessage(
            "راجع جلستك — يمكنك التوقف في أي وقت."),
        "reviewTrack": MessageLookupByLibrary.simpleMessage("المسار"),
        "reviewType": MessageLookupByLibrary.simpleMessage("النوع"),
        "role_android": MessageLookupByLibrary.simpleMessage("مطور Android"),
        "role_backend": MessageLookupByLibrary.simpleMessage("مطور Backend"),
        "role_data": MessageLookupByLibrary.simpleMessage("مهندس بيانات"),
        "role_devops": MessageLookupByLibrary.simpleMessage("مهندس DevOps"),
        "role_flutter": MessageLookupByLibrary.simpleMessage("مطور Flutter"),
        "role_frontend": MessageLookupByLibrary.simpleMessage("مطور Frontend"),
        "role_fullstack":
            MessageLookupByLibrary.simpleMessage("مطور Full Stack"),
        "role_ios": MessageLookupByLibrary.simpleMessage("مطور iOS"),
        "see_all": MessageLookupByLibrary.simpleMessage("عرض الكل"),
        "send_again": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "signUp": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "signing_in":
            MessageLookupByLibrary.simpleMessage("جاري تسجيل الدخول..."),
        "signing_up":
            MessageLookupByLibrary.simpleMessage("جاري تسجيل الدخول..."),
        "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
        "skipQuestion": MessageLookupByLibrary.simpleMessage("تخطي السؤال"),
        "skipped": MessageLookupByLibrary.simpleMessage("تم التخطي"),
        "speaking": MessageLookupByLibrary.simpleMessage("يتحدث الآن..."),
        "speechSensitivity":
            MessageLookupByLibrary.simpleMessage("حساسية الميكروفون"),
        "startInterview": MessageLookupByLibrary.simpleMessage("ابدأ المقابلة"),
        "step1of6": MessageLookupByLibrary.simpleMessage("الخطوة 1 من 6"),
        "step2of6": MessageLookupByLibrary.simpleMessage("الخطوة 2 من 6"),
        "step3of6": MessageLookupByLibrary.simpleMessage("الخطوة 3 من 6"),
        "step4of6": MessageLookupByLibrary.simpleMessage("الخطوة 4 من 6"),
        "step5of6": MessageLookupByLibrary.simpleMessage("الخطوة 5 من 6"),
        "step6of6": MessageLookupByLibrary.simpleMessage("الخطوة 6 من 6"),
        "step_1_of_5": MessageLookupByLibrary.simpleMessage("الخطوة 1 من 5"),
        "submitAnswer": MessageLookupByLibrary.simpleMessage("تأكيد الإجابة"),
        "supportSection":
            MessageLookupByLibrary.simpleMessage("الدعم وحول التطبيق"),
        "switchToText":
            MessageLookupByLibrary.simpleMessage("التبديل إلى الكتابة"),
        "switchToVoice":
            MessageLookupByLibrary.simpleMessage("التبديل إلى الصوت"),
        "tapToSpeak":
            MessageLookupByLibrary.simpleMessage("اضغط للتحدث بإجابتك"),
        "tapToStop":
            MessageLookupByLibrary.simpleMessage("اضغط لإيقاف التسجيل"),
        "targetRoleHint":
            MessageLookupByLibrary.simpleMessage("الدور المستهدف"),
        "themeDark": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
        "themeLight": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
        "themeSystem":
            MessageLookupByLibrary.simpleMessage("تلقائي حسب النظام"),
        "timeSpent": MessageLookupByLibrary.simpleMessage("الوقت المستغرق"),
        "tip": MessageLookupByLibrary.simpleMessage("تلميح. "),
        "topPerformer": MessageLookupByLibrary.simpleMessage("أداء متميز"),
        "trackMaster": MessageLookupByLibrary.simpleMessage("خبير المسار"),
        "trackSelection": MessageLookupByLibrary.simpleMessage("اختيار المسار"),
        "track_algorithms": MessageLookupByLibrary.simpleMessage("خوارزميات"),
        "track_backend": MessageLookupByLibrary.simpleMessage("Backend"),
        "track_flutter": MessageLookupByLibrary.simpleMessage("Flutter"),
        "track_frontend": MessageLookupByLibrary.simpleMessage("Frontend"),
        "track_hr": MessageLookupByLibrary.simpleMessage("الموارد البشرية"),
        "track_nodejs": MessageLookupByLibrary.simpleMessage("Node.js"),
        "track_oop": MessageLookupByLibrary.simpleMessage("OOP"),
        "track_react": MessageLookupByLibrary.simpleMessage("React"),
        "track_solid": MessageLookupByLibrary.simpleMessage("SOLID"),
        "track_system_design":
            MessageLookupByLibrary.simpleMessage("تصميم النظم"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
        "typeYourAnswer":
            MessageLookupByLibrary.simpleMessage("اكتب إجابتك هنا..."),
        "uploadPdfResumeJD": MessageLookupByLibrary.simpleMessage(
            "رفع السيرة الذاتية / الوصف الوظيفي PDF"),
        "verify_email_then_login": MessageLookupByLibrary.simpleMessage(
            "الرجاء التحقق من بريدك الإلكتروني ثم تسجيل الدخول"),
        "voiceAlex": MessageLookupByLibrary.simpleMessage("أليكس (قائد تقني)"),
        "voiceSarah":
            MessageLookupByLibrary.simpleMessage("سارة (أخصائية موارد بشرية)"),
        "what_are_you_interviewing_for": MessageLookupByLibrary.simpleMessage(
            "ما هو المنصب الذي تجري مقابلة من أجله؟"),
        "yourAnswer": MessageLookupByLibrary.simpleMessage("إجابتك")
      };
}
