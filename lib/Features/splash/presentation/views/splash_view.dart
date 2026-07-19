import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      if (getIt<AuthService>().user != null &&
          getIt<AuthService>().isUserLoggedIn()) {
        context.go(AppRoutes.homeScreen);
      } else {
        context.go(AppRoutes.signInScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "AI Interview Coach",
          style: AppTextStyles.titleM.copyWith(color: AppColors.neutral900),
        ),
      ),
    );
  }
}
