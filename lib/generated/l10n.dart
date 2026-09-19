// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back. Let's get you interview-ready.`
  String get login_subtitle {
    return Intl.message(
      'Welcome back. Let\'s get you interview-ready.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email_address {
    return Intl.message(
      'Email address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forget_password {
    return Intl.message(
      'Forgot password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get or_continue_with {
    return Intl.message(
      'Or continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Create your account and start practicing.`
  String get create_account_and_start_practicing {
    return Intl.message(
      'Create your account and start practicing.',
      name: 'create_account_and_start_practicing',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we'll send you a link to reset your password.`
  String get forget_password_subtitle {
    return Intl.message(
      'Enter your email address and we\'ll send you a link to reset your password.',
      name: 'forget_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_success {
    return Intl.message(
      'Login successful',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continue_with_apple {
    return Intl.message(
      'Continue with Apple',
      name: 'continue_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Good morning`
  String get good_morning {
    return Intl.message(
      'Good morning',
      name: 'good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get resume {
    return Intl.message(
      'Resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `React - Technical`
  String get react_technical {
    return Intl.message(
      'React - Technical',
      name: 'react_technical',
      desc: '',
      args: [],
    );
  }

  /// `Question 8 of 12 • Mid level`
  String get question_8_of_12_mid_level {
    return Intl.message(
      'Question 8 of 12 • Mid level',
      name: 'question_8_of_12_mid_level',
      desc: '',
      args: [],
    );
  }

  /// `Choose Interview Track`
  String get choose_interview_track {
    return Intl.message(
      'Choose Interview Track',
      name: 'choose_interview_track',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get track_flutter {
    return Intl.message(
      'Flutter',
      name: 'track_flutter',
      desc: '',
      args: [],
    );
  }

  /// `Widgets, state, as...`
  String get desc_flutter {
    return Intl.message(
      'Widgets, state, as...',
      name: 'desc_flutter',
      desc: '',
      args: [],
    );
  }

  /// `Backend`
  String get track_backend {
    return Intl.message(
      'Backend',
      name: 'track_backend',
      desc: '',
      args: [],
    );
  }

  /// `APIs, databases, ...`
  String get desc_backend {
    return Intl.message(
      'APIs, databases, ...',
      name: 'desc_backend',
      desc: '',
      args: [],
    );
  }

  /// `Frontend`
  String get track_frontend {
    return Intl.message(
      'Frontend',
      name: 'track_frontend',
      desc: '',
      args: [],
    );
  }

  /// `DOM, CSS, perfor...`
  String get desc_frontend {
    return Intl.message(
      'DOM, CSS, perfor...',
      name: 'desc_frontend',
      desc: '',
      args: [],
    );
  }

  /// `React`
  String get track_react {
    return Intl.message(
      'React',
      name: 'track_react',
      desc: '',
      args: [],
    );
  }

  /// `Hooks, rendering, ...`
  String get desc_react {
    return Intl.message(
      'Hooks, rendering, ...',
      name: 'desc_react',
      desc: '',
      args: [],
    );
  }

  /// `Node.js`
  String get track_nodejs {
    return Intl.message(
      'Node.js',
      name: 'track_nodejs',
      desc: '',
      args: [],
    );
  }

  /// `Event loop, strea...`
  String get desc_nodejs {
    return Intl.message(
      'Event loop, strea...',
      name: 'desc_nodejs',
      desc: '',
      args: [],
    );
  }

  /// `System Design`
  String get track_system_design {
    return Intl.message(
      'System Design',
      name: 'track_system_design',
      desc: '',
      args: [],
    );
  }

  /// `Scale, tradeoffs`
  String get desc_system_design {
    return Intl.message(
      'Scale, tradeoffs',
      name: 'desc_system_design',
      desc: '',
      args: [],
    );
  }

  /// `Algorithms`
  String get track_algorithms {
    return Intl.message(
      'Algorithms',
      name: 'track_algorithms',
      desc: '',
      args: [],
    );
  }

  /// `DS, complexity`
  String get desc_algorithms {
    return Intl.message(
      'DS, complexity',
      name: 'desc_algorithms',
      desc: '',
      args: [],
    );
  }

  /// `HR`
  String get track_hr {
    return Intl.message(
      'HR',
      name: 'track_hr',
      desc: '',
      args: [],
    );
  }

  /// `Behavioral, culture`
  String get desc_hr {
    return Intl.message(
      'Behavioral, culture',
      name: 'desc_hr',
      desc: '',
      args: [],
    );
  }

  /// `OOP`
  String get track_oop {
    return Intl.message(
      'OOP',
      name: 'track_oop',
      desc: '',
      args: [],
    );
  }

  /// `Design, patterns`
  String get desc_oop {
    return Intl.message(
      'Design, patterns',
      name: 'desc_oop',
      desc: '',
      args: [],
    );
  }

  /// `SOLID`
  String get track_solid {
    return Intl.message(
      'SOLID',
      name: 'track_solid',
      desc: '',
      args: [],
    );
  }

  /// `Principles, clean ...`
  String get desc_solid {
    return Intl.message(
      'Principles, clean ...',
      name: 'desc_solid',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get nav_home {
    return Intl.message(
      'Home',
      name: 'nav_home',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get nav_history {
    return Intl.message(
      'History',
      name: 'nav_history',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get nav_stats {
    return Intl.message(
      'Stats',
      name: 'nav_stats',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get nav_profile {
    return Intl.message(
      'Profile',
      name: 'nav_profile',
      desc: '',
      args: [],
    );
  }

  /// `Job Role`
  String get job_role_title {
    return Intl.message(
      'Job Role',
      name: 'job_role_title',
      desc: '',
      args: [],
    );
  }

  /// `Step 1 of 5`
  String get step_1_of_5 {
    return Intl.message(
      'Step 1 of 5',
      name: 'step_1_of_5',
      desc: '',
      args: [],
    );
  }

  /// `What are you interviewing for?`
  String get what_are_you_interviewing_for {
    return Intl.message(
      'What are you interviewing for?',
      name: 'what_are_you_interviewing_for',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get role_flutter {
    return Intl.message(
      'Flutter Developer',
      name: 'role_flutter',
      desc: '',
      args: [],
    );
  }

  /// `Backend Developer`
  String get role_backend {
    return Intl.message(
      'Backend Developer',
      name: 'role_backend',
      desc: '',
      args: [],
    );
  }

  /// `Android Developer`
  String get role_android {
    return Intl.message(
      'Android Developer',
      name: 'role_android',
      desc: '',
      args: [],
    );
  }

  /// `Frontend Developer`
  String get role_frontend {
    return Intl.message(
      'Frontend Developer',
      name: 'role_frontend',
      desc: '',
      args: [],
    );
  }

  /// `Full Stack Developer`
  String get role_fullstack {
    return Intl.message(
      'Full Stack Developer',
      name: 'role_fullstack',
      desc: '',
      args: [],
    );
  }

  /// `Data Engineer`
  String get role_data {
    return Intl.message(
      'Data Engineer',
      name: 'role_data',
      desc: '',
      args: [],
    );
  }

  /// `DevOps Engineer`
  String get role_devops {
    return Intl.message(
      'DevOps Engineer',
      name: 'role_devops',
      desc: '',
      args: [],
    );
  }

  /// `iOS Developer`
  String get role_ios {
    return Intl.message(
      'iOS Developer',
      name: 'role_ios',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_btn {
    return Intl.message(
      'Continue',
      name: 'continue_btn',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE WHERE YOU LEFT OFF`
  String get continue_where_you_left_off {
    return Intl.message(
      'CONTINUE WHERE YOU LEFT OFF',
      name: 'continue_where_you_left_off',
      desc: '',
      args: [],
    );
  }

  /// `Email not verified`
  String get email_not_verified {
    return Intl.message(
      'Email not verified',
      name: 'email_not_verified',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_your_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `signing in`
  String get signing_in {
    return Intl.message(
      'signing in',
      name: 'signing_in',
      desc: '',
      args: [],
    );
  }

  /// `signing up`
  String get signing_up {
    return Intl.message(
      'signing up',
      name: 'signing_up',
      desc: '',
      args: [],
    );
  }

  /// `Send Again`
  String get send_again {
    return Intl.message(
      'Send Again',
      name: 'send_again',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get ok {
    return Intl.message(
      'Got it',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent`
  String get password_reset_email_sent {
    return Intl.message(
      'Password reset email sent',
      name: 'password_reset_email_sent',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email then login`
  String get verify_email_then_login {
    return Intl.message(
      'Verify your email then login',
      name: 'verify_email_then_login',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Email has been sent successfully`
  String get Email_has_been_sent_successfully {
    return Intl.message(
      'Email has been sent successfully',
      name: 'Email_has_been_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Track Selection`
  String get trackSelection {
    return Intl.message(
      'Track Selection',
      name: 'trackSelection',
      desc: '',
      args: [],
    );
  }

  /// `Choose the interview domain.`
  String get chooseTrackDomain {
    return Intl.message(
      'Choose the interview domain.',
      name: 'chooseTrackDomain',
      desc: '',
      args: [],
    );
  }

  /// `Step 1 of 6`
  String get step1of6 {
    return Intl.message(
      'Step 1 of 6',
      name: 'step1of6',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred technology.`
  String get chooseTechnology {
    return Intl.message(
      'Choose your preferred technology.',
      name: 'chooseTechnology',
      desc: '',
      args: [],
    );
  }

  /// `Step 2 of 6`
  String get step2of6 {
    return Intl.message(
      'Step 2 of 6',
      name: 'step2of6',
      desc: '',
      args: [],
    );
  }

  /// `Step 3 of 6`
  String get step3of6 {
    return Intl.message(
      'Step 3 of 6',
      name: 'step3of6',
      desc: '',
      args: [],
    );
  }

  /// `Experience Level`
  String get experienceLevel {
    return Intl.message(
      'Experience Level',
      name: 'experienceLevel',
      desc: '',
      args: [],
    );
  }

  /// `Choose your experience level.`
  String get chooseExperience {
    return Intl.message(
      'Choose your experience level.',
      name: 'chooseExperience',
      desc: '',
      args: [],
    );
  }

  /// `We'll calibrate expectations, not difficulty.`
  String get calibrateExpectation {
    return Intl.message(
      'We\'ll calibrate expectations, not difficulty.',
      name: 'calibrateExpectation',
      desc: '',
      args: [],
    );
  }

  /// `Step 4 of 6`
  String get step4of6 {
    return Intl.message(
      'Step 4 of 6',
      name: 'step4of6',
      desc: '',
      args: [],
    );
  }

  /// `Paste the job description`
  String get pasteJobDescription {
    return Intl.message(
      'Paste the job description',
      name: 'pasteJobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Optional · we'll tailor questions to the role.`
  String get optionalTailor {
    return Intl.message(
      'Optional · we\'ll tailor questions to the role.',
      name: 'optionalTailor',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `chars`
  String get chars {
    return Intl.message(
      'chars',
      name: 'chars',
      desc: '',
      args: [],
    );
  }

  /// `Paste job description here…`
  String get pasteJobDescriptionHint {
    return Intl.message(
      'Paste job description here…',
      name: 'pasteJobDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `AI parsed ✓`
  String get aiParsed {
    return Intl.message(
      'AI parsed ✓',
      name: 'aiParsed',
      desc: '',
      args: [],
    );
  }

  /// `Upload PDF Resume / JD`
  String get uploadPdfResumeJD {
    return Intl.message(
      'Upload PDF Resume / JD',
      name: 'uploadPdfResumeJD',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Pick a difficulty`
  String get pickADifficulty {
    return Intl.message(
      'Pick a difficulty',
      name: 'pickADifficulty',
      desc: '',
      args: [],
    );
  }

  /// `Independent of experience — challenge yourself.`
  String get independentOfExperience {
    return Intl.message(
      'Independent of experience — challenge yourself.',
      name: 'independentOfExperience',
      desc: '',
      args: [],
    );
  }

  /// `Interview type`
  String get interviewType {
    return Intl.message(
      'Interview type',
      name: 'interviewType',
      desc: '',
      args: [],
    );
  }

  /// `Format your session end-to-end.`
  String get interviewTypeSubtitle {
    return Intl.message(
      'Format your session end-to-end.',
      name: 'interviewTypeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Technical`
  String get interviewTypeTechnical {
    return Intl.message(
      'Technical',
      name: 'interviewTypeTechnical',
      desc: '',
      args: [],
    );
  }

  /// `Deep-dive on stack knowledge`
  String get interviewTypeTechnicalSub {
    return Intl.message(
      'Deep-dive on stack knowledge',
      name: 'interviewTypeTechnicalSub',
      desc: '',
      args: [],
    );
  }

  /// `HR`
  String get interviewTypeHR {
    return Intl.message(
      'HR',
      name: 'interviewTypeHR',
      desc: '',
      args: [],
    );
  }

  /// `Behavioral & culture-fit`
  String get interviewTypeHRSub {
    return Intl.message(
      'Behavioral & culture-fit',
      name: 'interviewTypeHRSub',
      desc: '',
      args: [],
    );
  }

  /// `Mixed`
  String get interviewTypeMixed {
    return Intl.message(
      'Mixed',
      name: 'interviewTypeMixed',
      desc: '',
      args: [],
    );
  }

  /// `Balanced technical + behavioral`
  String get interviewTypeMixedSub {
    return Intl.message(
      'Balanced technical + behavioral',
      name: 'interviewTypeMixedSub',
      desc: '',
      args: [],
    );
  }

  /// `Rapid Fire`
  String get interviewTypeRapidFire {
    return Intl.message(
      'Rapid Fire',
      name: 'interviewTypeRapidFire',
      desc: '',
      args: [],
    );
  }

  /// `30s per question · pressure test`
  String get interviewTypeRapidFireSub {
    return Intl.message(
      '30s per question · pressure test',
      name: 'interviewTypeRapidFireSub',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get experienceBeginner {
    return Intl.message(
      'Beginner',
      name: 'experienceBeginner',
      desc: '',
      args: [],
    );
  }

  /// `0–1 years · fundamentals`
  String get experienceBeginnerSub {
    return Intl.message(
      '0–1 years · fundamentals',
      name: 'experienceBeginnerSub',
      desc: '',
      args: [],
    );
  }

  /// `Junior`
  String get experienceJunior {
    return Intl.message(
      'Junior',
      name: 'experienceJunior',
      desc: '',
      args: [],
    );
  }

  /// `1–3 years · shipping features`
  String get experienceJuniorSub {
    return Intl.message(
      '1–3 years · shipping features',
      name: 'experienceJuniorSub',
      desc: '',
      args: [],
    );
  }

  /// `Mid-Level`
  String get experienceMid {
    return Intl.message(
      'Mid-Level',
      name: 'experienceMid',
      desc: '',
      args: [],
    );
  }

  /// `3–5 years · owns modules`
  String get experienceMidSub {
    return Intl.message(
      '3–5 years · owns modules',
      name: 'experienceMidSub',
      desc: '',
      args: [],
    );
  }

  /// `Senior`
  String get experienceSenior {
    return Intl.message(
      'Senior',
      name: 'experienceSenior',
      desc: '',
      args: [],
    );
  }

  /// `5+ years · leads architecture`
  String get experienceSeniorSub {
    return Intl.message(
      '5+ years · leads architecture',
      name: 'experienceSeniorSub',
      desc: '',
      args: [],
    );
  }

  /// `Easy`
  String get difficultyEasy {
    return Intl.message(
      'Easy',
      name: 'difficultyEasy',
      desc: '',
      args: [],
    );
  }

  /// `Warm-up · concept checks`
  String get difficultyEasySub {
    return Intl.message(
      'Warm-up · concept checks',
      name: 'difficultyEasySub',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get difficultyMedium {
    return Intl.message(
      'Medium',
      name: 'difficultyMedium',
      desc: '',
      args: [],
    );
  }

  /// `Realistic on-site pace`
  String get difficultyMediumSub {
    return Intl.message(
      'Realistic on-site pace',
      name: 'difficultyMediumSub',
      desc: '',
      args: [],
    );
  }

  /// `Hard`
  String get difficultyHard {
    return Intl.message(
      'Hard',
      name: 'difficultyHard',
      desc: '',
      args: [],
    );
  }

  /// `FAANG-tier · deep follow-ups`
  String get difficultyHardSub {
    return Intl.message(
      'FAANG-tier · deep follow-ups',
      name: 'difficultyHardSub',
      desc: '',
      args: [],
    );
  }

  /// `Tip. `
  String get tip {
    return Intl.message(
      'Tip. ',
      name: 'tip',
      desc: '',
      args: [],
    );
  }

  /// `Try Junior + Hard for stretch practice, or Senior + Easy for a fluency drill.`
  String get difficultyTipMessage {
    return Intl.message(
      'Try Junior + Hard for stretch practice, or Senior + Easy for a fluency drill.',
      name: 'difficultyTipMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ready to start?`
  String get readyToStart {
    return Intl.message(
      'Ready to start?',
      name: 'readyToStart',
      desc: '',
      args: [],
    );
  }

  /// `Review your session — you can pause anytime.`
  String get reviewSessionSubtitle {
    return Intl.message(
      'Review your session — you can pause anytime.',
      name: 'reviewSessionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `TRACK`
  String get reviewTrack {
    return Intl.message(
      'TRACK',
      name: 'reviewTrack',
      desc: '',
      args: [],
    );
  }

  /// `EXPERIENCE`
  String get reviewExperience {
    return Intl.message(
      'EXPERIENCE',
      name: 'reviewExperience',
      desc: '',
      args: [],
    );
  }

  /// `DIFFICULTY`
  String get reviewDifficulty {
    return Intl.message(
      'DIFFICULTY',
      name: 'reviewDifficulty',
      desc: '',
      args: [],
    );
  }

  /// `TYPE`
  String get reviewType {
    return Intl.message(
      'TYPE',
      name: 'reviewType',
      desc: '',
      args: [],
    );
  }

  /// `JOB DESCRIPTION`
  String get reviewJobDescription {
    return Intl.message(
      'JOB DESCRIPTION',
      name: 'reviewJobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Not provided`
  String get notProvided {
    return Intl.message(
      'Not provided',
      name: 'notProvided',
      desc: '',
      args: [],
    );
  }

  /// `Start Interview`
  String get startInterview {
    return Intl.message(
      'Start Interview',
      name: 'startInterview',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty Level`
  String get difficultyScreen {
    return Intl.message(
      'Difficulty Level',
      name: 'difficultyScreen',
      desc: '',
      args: [],
    );
  }

  /// `Step 5 of 6`
  String get step5of6 {
    return Intl.message(
      'Step 5 of 6',
      name: 'step5of6',
      desc: '',
      args: [],
    );
  }

  /// `Step 6 of 6`
  String get step6of6 {
    return Intl.message(
      'Step 6 of 6',
      name: 'step6of6',
      desc: '',
      args: [],
    );
  }

  /// `Alex · AI Interviewer`
  String get interviewerName {
    return Intl.message(
      'Alex · AI Interviewer',
      name: 'interviewerName',
      desc: '',
      args: [],
    );
  }

  /// `Technical Lead`
  String get interviewerRole {
    return Intl.message(
      'Technical Lead',
      name: 'interviewerRole',
      desc: '',
      args: [],
    );
  }

  /// `Speaking...`
  String get speaking {
    return Intl.message(
      'Speaking...',
      name: 'speaking',
      desc: '',
      args: [],
    );
  }

  /// `Listening...`
  String get listening {
    return Intl.message(
      'Listening...',
      name: 'listening',
      desc: '',
      args: [],
    );
  }

  /// `Tap to speak your answer`
  String get tapToSpeak {
    return Intl.message(
      'Tap to speak your answer',
      name: 'tapToSpeak',
      desc: '',
      args: [],
    );
  }

  /// `Tap to stop recording`
  String get tapToStop {
    return Intl.message(
      'Tap to stop recording',
      name: 'tapToStop',
      desc: '',
      args: [],
    );
  }

  /// `Type your answer here...`
  String get typeYourAnswer {
    return Intl.message(
      'Type your answer here...',
      name: 'typeYourAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Your Response`
  String get yourAnswer {
    return Intl.message(
      'Your Response',
      name: 'yourAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Interviewer's Model Answer`
  String get modelAnswer {
    return Intl.message(
      'Interviewer\'s Model Answer',
      name: 'modelAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Submit Answer`
  String get submitAnswer {
    return Intl.message(
      'Submit Answer',
      name: 'submitAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Next Question`
  String get nextQuestion {
    return Intl.message(
      'Next Question',
      name: 'nextQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Complete Interview`
  String get finishInterview {
    return Intl.message(
      'Complete Interview',
      name: 'finishInterview',
      desc: '',
      args: [],
    );
  }

  /// `Switch to typing`
  String get switchToText {
    return Intl.message(
      'Switch to typing',
      name: 'switchToText',
      desc: '',
      args: [],
    );
  }

  /// `Switch to voice`
  String get switchToVoice {
    return Intl.message(
      'Switch to voice',
      name: 'switchToVoice',
      desc: '',
      args: [],
    );
  }

  /// `Replay`
  String get replayQuestion {
    return Intl.message(
      'Replay',
      name: 'replayQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pauseSession {
    return Intl.message(
      'Pause',
      name: 'pauseSession',
      desc: '',
      args: [],
    );
  }

  /// `Question {current} of {total}`
  String questionOf(Object current, Object total) {
    return Intl.message(
      'Question $current of $total',
      name: 'questionOf',
      desc: '',
      args: [current, total],
    );
  }

  /// `Exit Interview`
  String get exitInterview {
    return Intl.message(
      'Exit Interview',
      name: 'exitInterview',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit? Your current progress will be lost.`
  String get exitInterviewConfirm {
    return Intl.message(
      'Are you sure you want to exit? Your current progress will be lost.',
      name: 'exitInterviewConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Speak clearly. Tap the mic when finished.`
  String get listeningHint {
    return Intl.message(
      'Speak clearly. Tap the mic when finished.',
      name: 'listeningHint',
      desc: '',
      args: [],
    );
  }

  /// `Alex is crafting your interview...`
  String get generatingQuestions {
    return Intl.message(
      'Alex is crafting your interview...',
      name: 'generatingQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Generating 10 tailored questions based on your profile`
  String get generatingQuestionsSub {
    return Intl.message(
      'Generating 10 tailored questions based on your profile',
      name: 'generatingQuestionsSub',
      desc: '',
      args: [],
    );
  }

  /// `Skip Question`
  String get skipQuestion {
    return Intl.message(
      'Skip Question',
      name: 'skipQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Skipped`
  String get skipped {
    return Intl.message(
      'Skipped',
      name: 'skipped',
      desc: '',
      args: [],
    );
  }

  /// `Interview Completed!`
  String get interviewCompleted {
    return Intl.message(
      'Interview Completed!',
      name: 'interviewCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Great job completing your interview session.`
  String get interviewCompletedSub {
    return Intl.message(
      'Great job completing your interview session.',
      name: 'interviewCompletedSub',
      desc: '',
      args: [],
    );
  }

  /// `Time Spent`
  String get timeSpent {
    return Intl.message(
      'Time Spent',
      name: 'timeSpent',
      desc: '',
      args: [],
    );
  }

  /// `Answered`
  String get questionsAnswered {
    return Intl.message(
      'Answered',
      name: 'questionsAnswered',
      desc: '',
      args: [],
    );
  }

  /// `Completion`
  String get completionRate {
    return Intl.message(
      'Completion',
      name: 'completionRate',
      desc: '',
      args: [],
    );
  }

  /// `Review All Questions`
  String get reviewAnswers {
    return Intl.message(
      'Review All Questions',
      name: 'reviewAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Practice Again`
  String get practiceAgain {
    return Intl.message(
      'Practice Again',
      name: 'practiceAgain',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message(
      'Back to Home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `No answer provided (Skipped)`
  String get noAnswerProvided {
    return Intl.message(
      'No answer provided (Skipped)',
      name: 'noAnswerProvided',
      desc: '',
      args: [],
    );
  }

  /// `Interview History`
  String get historyTitle {
    return Intl.message(
      'Interview History',
      name: 'historyTitle',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get filterAll {
    return Intl.message(
      'All',
      name: 'filterAll',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get filterInProgress {
    return Intl.message(
      'In Progress',
      name: 'filterInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get filterCompleted {
    return Intl.message(
      'Completed',
      name: 'filterCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Continue Interview`
  String get continueInterview {
    return Intl.message(
      'Continue Interview',
      name: 'continueInterview',
      desc: '',
      args: [],
    );
  }

  /// `No interviews found`
  String get noHistoryFound {
    return Intl.message(
      'No interviews found',
      name: 'noHistoryFound',
      desc: '',
      args: [],
    );
  }

  /// `Start your first interview to track your progress here.`
  String get noHistoryFoundSub {
    return Intl.message(
      'Start your first interview to track your progress here.',
      name: 'noHistoryFoundSub',
      desc: '',
      args: [],
    );
  }

  /// `Delete Interview`
  String get deleteInterview {
    return Intl.message(
      'Delete Interview',
      name: 'deleteInterview',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this interview record?`
  String get deleteInterviewConfirm {
    return Intl.message(
      'Are you sure you want to delete this interview record?',
      name: 'deleteInterviewConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Interview Details`
  String get interviewDetails {
    return Intl.message(
      'Interview Details',
      name: 'interviewDetails',
      desc: '',
      args: [],
    );
  }

  /// `{answered} of {total} Questions`
  String questionsCount(Object answered, Object total) {
    return Intl.message(
      '$answered of $total Questions',
      name: 'questionsCount',
      desc: '',
      args: [answered, total],
    );
  }

  /// `{total} Questions`
  String questionsCountCompleted(Object total) {
    return Intl.message(
      '$total Questions',
      name: 'questionsCountCompleted',
      desc: '',
      args: [total],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Active Candidate`
  String get activeCandidate {
    return Intl.message(
      'Active Candidate',
      name: 'activeCandidate',
      desc: '',
      args: [],
    );
  }

  /// `85% Readiness`
  String get readinessScore {
    return Intl.message(
      '85% Readiness',
      name: 'readinessScore',
      desc: '',
      args: [],
    );
  }

  /// `INTERVIEWS`
  String get interviewsCount {
    return Intl.message(
      'INTERVIEWS',
      name: 'interviewsCount',
      desc: '',
      args: [],
    );
  }

  /// `AVG. SCORE`
  String get avgScore {
    return Intl.message(
      'AVG. SCORE',
      name: 'avgScore',
      desc: '',
      args: [],
    );
  }

  /// `FAV. TRACK`
  String get favTrack {
    return Intl.message(
      'FAV. TRACK',
      name: 'favTrack',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get achievements {
    return Intl.message(
      'Achievements',
      name: 'achievements',
      desc: '',
      args: [],
    );
  }

  /// `{days}-day streak`
  String dayStreak(Object days) {
    return Intl.message(
      '$days-day streak',
      name: 'dayStreak',
      desc: '',
      args: [days],
    );
  }

  /// `Fast thinker`
  String get fastThinker {
    return Intl.message(
      'Fast thinker',
      name: 'fastThinker',
      desc: '',
      args: [],
    );
  }

  /// `Top Performer`
  String get topPerformer {
    return Intl.message(
      'Top Performer',
      name: 'topPerformer',
      desc: '',
      args: [],
    );
  }

  /// `Track Master`
  String get trackMaster {
    return Intl.message(
      'Track Master',
      name: 'trackMaster',
      desc: '',
      args: [],
    );
  }

  /// `First Step`
  String get firstInterviewBadge {
    return Intl.message(
      'First Step',
      name: 'firstInterviewBadge',
      desc: '',
      args: [],
    );
  }

  /// `My Resume & Target Role`
  String get myResumeAndRole {
    return Intl.message(
      'My Resume & Target Role',
      name: 'myResumeAndRole',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out of your account?`
  String get logOutConfirm {
    return Intl.message(
      'Are you sure you want to log out of your account?',
      name: 'logOutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `PREFERENCES`
  String get preferencesSection {
    return Intl.message(
      'PREFERENCES',
      name: 'preferencesSection',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get themeSystem {
    return Intl.message(
      'System Default',
      name: 'themeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get themeLight {
    return Intl.message(
      'Light Mode',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get themeDark {
    return Intl.message(
      'Dark Mode',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic (العربية)`
  String get arabic {
    return Intl.message(
      'Arabic (العربية)',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `AI & INTERVIEW`
  String get interviewExperienceSection {
    return Intl.message(
      'AI & INTERVIEW',
      name: 'interviewExperienceSection',
      desc: '',
      args: [],
    );
  }

  /// `AI Voice`
  String get aiVoice {
    return Intl.message(
      'AI Voice',
      name: 'aiVoice',
      desc: '',
      args: [],
    );
  }

  /// `Alex (Technical Lead)`
  String get voiceAlex {
    return Intl.message(
      'Alex (Technical Lead)',
      name: 'voiceAlex',
      desc: '',
      args: [],
    );
  }

  /// `Sarah (HR Specialist)`
  String get voiceSarah {
    return Intl.message(
      'Sarah (HR Specialist)',
      name: 'voiceSarah',
      desc: '',
      args: [],
    );
  }

  /// `Microphone Sensitivity`
  String get speechSensitivity {
    return Intl.message(
      'Microphone Sensitivity',
      name: 'speechSensitivity',
      desc: '',
      args: [],
    );
  }

  /// `Auto-stop Silence Delay`
  String get autoStopDelay {
    return Intl.message(
      'Auto-stop Silence Delay',
      name: 'autoStopDelay',
      desc: '',
      args: [],
    );
  }

  /// `ACCOUNT & DATA`
  String get accountSection {
    return Intl.message(
      'ACCOUNT & DATA',
      name: 'accountSection',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Clear Offline Sessions`
  String get clearCache {
    return Intl.message(
      'Clear Offline Sessions',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `Cache cleared successfully`
  String get clearCacheSuccess {
    return Intl.message(
      'Cache cleared successfully',
      name: 'clearCacheSuccess',
      desc: '',
      args: [],
    );
  }

  /// `SUPPORT & ABOUT`
  String get supportSection {
    return Intl.message(
      'SUPPORT & ABOUT',
      name: 'supportSection',
      desc: '',
      args: [],
    );
  }

  /// `Help & FAQ`
  String get helpCenter {
    return Intl.message(
      'Help & FAQ',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message(
      'App Version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to permanently delete your account? All your data and progress will be lost.`
  String get deleteAccountConfirm {
    return Intl.message(
      'Are you sure you want to permanently delete your account? All your data and progress will be lost.',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Choose Theme`
  String get chooseTheme {
    return Intl.message(
      'Choose Theme',
      name: 'chooseTheme',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get noStatsYet {
    return Intl.message(
      'N/A',
      name: 'noStatsYet',
      desc: '',
      args: [],
    );
  }

  /// `Target Role`
  String get targetRoleHint {
    return Intl.message(
      'Target Role',
      name: 'targetRoleHint',
      desc: '',
      args: [],
    );
  }

  /// `Paste from Clipboard`
  String get pasteFromClipboard {
    return Intl.message(
      'Paste from Clipboard',
      name: 'pasteFromClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clearText {
    return Intl.message(
      'Clear',
      name: 'clearText',
      desc: '',
      args: [],
    );
  }

  /// `Remove File`
  String get removeFile {
    return Intl.message(
      'Remove File',
      name: 'removeFile',
      desc: '',
      args: [],
    );
  }

  /// `Quick Templates`
  String get quickTemplates {
    return Intl.message(
      'Quick Templates',
      name: 'quickTemplates',
      desc: '',
      args: [],
    );
  }

  /// `Document Ready`
  String get fileReady {
    return Intl.message(
      'Document Ready',
      name: 'fileReady',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
