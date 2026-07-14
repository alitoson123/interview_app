import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_header.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
          AuthHeader(subtitle: s.forget_password_subtitle),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: s.email_address,
              prefixIcon: Icon(Icons.mail_outline, size: 20.sp),
                            prefixIconConstraints: BoxConstraints(minWidth: 30.w),

            ),
          ),
          SizedBox(height: 24.h),
          AppGradientButton(
            label: s.reset_password,
            onPressed: () {
              // Perform reset password
            },
            size: AppButtonSize.large,
          ),
        ],
      ),
    );
  }
}
