import 'package:go_router/go_router.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/views/sign_in_view.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/views/sign_up_view.dart';

class AppRoutes {
  // static String spalshScreen = '/';
  static String signInScreen = '/';
  static String signUpScreen = '/signUp';
  static String fogetPasswordScreen = '/fogetPassword';

  static final route = GoRouter(
    initialLocation: signInScreen,
    routes: [
      GoRoute(
        path: signInScreen,
        
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignInView(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),
      GoRoute(
        path: signUpScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpView(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),
      GoRoute(
        path: fogetPasswordScreen,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
