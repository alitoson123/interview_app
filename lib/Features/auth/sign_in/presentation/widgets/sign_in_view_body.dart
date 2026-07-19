import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/helpers/message.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_header.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_tab_switcher.dart';
import 'package:interview_app/Features/auth/core/widgets/social_login_section.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key, this.signInParams});
  final (String email, String password)? signInParams;

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _obscurePassword = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(
      text: widget.signInParams?.$1 ?? '',
    );
    _passwordController = TextEditingController(
      text: widget.signInParams?.$2 ?? '',
    );
  }

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
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return s.please_enter_email;
                }
                return null;
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return s.please_enter_password;
                }
                return null;
              },
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
              onPressed: () async {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
                if (_formKey.currentState!.validate()) {
                  bool isVerified = await getIt<AuthService>()
                      .isEmailVerified();
                  if (!mounted) return;
                  if (isVerified) {
                    context.read<SingInCubit>().signInMethod(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  } else {
                    Message.showAppDialog(
                      context: context,
                      type: DialogType.error,
                      message: s.email_not_verified,
                      isVerifyButton: true,
                    );
                  }
                }
              },
              icon: Icon(Icons.arrow_forward, size: 18.sp),
              size: AppButtonSize.large,
            ),
            SizedBox(height: 32.h),
            const SocialLoginSection(),
          ],
        ),
      ),
    );
  }
}
