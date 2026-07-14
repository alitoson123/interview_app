import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_header.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_tab_switcher.dart';
import 'package:interview_app/Features/auth/core/widgets/social_login_section.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
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
          AuthHeader(
            subtitle: s.create_account_and_start_practicing,
          ),
          AuthTabSwitcher(
            isLogin: false,
            onLoginTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.signInScreen);
            },
          ),
          SizedBox(height: 32.h),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: s.full_name,
              prefixIcon: Icon(Icons.person_outline, size: 20.sp),
                            prefixIconConstraints: BoxConstraints(minWidth: 30.w),

            ),
          ),
          SizedBox(height: 16.h),
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
          SizedBox(height: 24.h),
          AppGradientButton(
            label: s.create_account,
            onPressed: () {
              // Perform register
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
