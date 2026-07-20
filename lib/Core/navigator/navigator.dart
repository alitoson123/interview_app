import 'package:go_router/go_router.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/views/sign_in_view.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:interview_app/Features/home/presentation/views/home_view.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/difficulty_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/experience_level_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/job_description_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/interview_type_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/technology_selection_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/track_selection_screen.dart';
import 'package:interview_app/Features/interview_setup/presentation/views/interview_review_screen.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_setup_model.dart';
import 'package:interview_app/Features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String signInScreen = '/signIn';
  static const String signUpScreen = '/signUp';
  static const String fogetPasswordScreen = '/fogetPassword';
  static const String homeScreen = '/home';
  static const String trackSelectionScreen = '/trackSelection';
  static const String technologySelectionScreen = '/technologySelection';
  static const String experienceLevelScreen = '/experienceLevel';
  static const String jobDescriptionScreen = '/jobDescription';
  static const String interviewTypeScreen = '/interviewType';
  static const String difficultyScreen = '/difficulty';
  static const String interviewReviewScreen = '/interviewReview';

  static final route = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signInScreen,
        pageBuilder: (context, state) {
          final extra = state.extra as (String, String)?;
          return CustomTransitionPage(
            child: SignInView(signInParams: extra),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: signUpScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpView(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        ),
      ),
      GoRoute(
        path: fogetPasswordScreen,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(path: homeScreen, builder: (context, state) => const HomeView()),
      GoRoute(
        path: trackSelectionScreen,
        builder: (context, state) => const TrackSelectionScreen(),
      ),
      GoRoute(
        path: technologySelectionScreen,
        builder: (context, state) => TechnologySelectionScreen(
          interviewSetupModel: state.extra! as InterviewSetupModel,
        ),
      ),
      GoRoute(
        path: experienceLevelScreen,
        builder: (context, state) => ExperienceLevelScreen(
          interviewSetupModel: state.extra! as InterviewSetupModel,
        ),
      ),
      GoRoute(
        path: jobDescriptionScreen,
        builder: (context, state) => JobDescriptionScreen(
          interviewSetupModel: state.extra! as InterviewSetupModel,
        ),
      ),
      GoRoute(
        path: interviewTypeScreen,
        builder: (context, state) => InterviewTypeScreen(
          interviewSetupModel: state.extra! as InterviewSetupModel,
        ),
      ),
      GoRoute(
        path: difficultyScreen,
        builder: (context, state) => DifficultyScreen(
          interviewSetupModel: state.extra! as InterviewSetupModel,
        ),
      ),
      GoRoute(
        path: interviewReviewScreen,
        builder: (context, state) =>
            InterviewReviewScreen(interviewSetupModel: state.extra! as InterviewSetupModel),
      ),
    ],
  );
}
