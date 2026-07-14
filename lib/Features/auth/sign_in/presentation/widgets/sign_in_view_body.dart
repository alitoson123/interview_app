import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_header.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_tab_switcher.dart';
import 'package:interview_app/Features/auth/core/widgets/social_login_section.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthHeader(subtitle: s.login_subtitle),
          AuthTabSwitcher(
            isLogin: true,
            onRegisterTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.signUpScreen);
            },
          ),
          SizedBox(height: 32.h),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: s.email_address,
              prefixIcon: Icon(Icons.mail_outline, size: 20.sp),
              prefixIconConstraints: BoxConstraints(minWidth: 30.w),
            ),
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: s.password,
              prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
              prefixIconConstraints: BoxConstraints(minWidth: 30.w),
              suffixIconConstraints: BoxConstraints(minWidth: 40.w),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20.sp,
                  color: AppColors.neutral500,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.fogetPasswordScreen);
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: AppTextStyles.labelL,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(s.forget_password),
            ),
          ),
          SizedBox(height: 24.h),
          AppGradientButton(
            label: s.logIn,
            onPressed: () {
              // Perform log in
            },
            icon: Icon(Icons.arrow_forward, size: 18.sp),
            size: AppButtonSize.large,
          ),
          SizedBox(height: 32.h),
          const SocialLoginSection(),
        ],
      ),
    );
  }
}
