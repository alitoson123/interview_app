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
