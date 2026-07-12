import 'package:go_router/go_router.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/views/sign_in_view.dart';

class AppRoutes {
  // static String spalshScreen = '/';
  static String signInScreen = '/';

  static final route = GoRouter(
    initialLocation: signInScreen,
    routes: [
      GoRoute(
        path: signInScreen,
        builder: (context, state) => const SignInView(),
      ),
    ],
  );
}
