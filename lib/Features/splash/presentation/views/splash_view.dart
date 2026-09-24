import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/splash/presentation/widgets/splash_content.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _handleNavigation();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  void _handleNavigation() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!mounted) return;
      final authService = getIt<AuthService>();
      final isUserLoggedIn =
          authService.user != null && authService.isUserLoggedIn();

      if (isUserLoggedIn) {
        context.go(AppRoutes.homeScreen);
      } else {
        context.go(AppRoutes.signInScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: const SplashContent(),
          ),
        ),
      ),
    );
  }
}
