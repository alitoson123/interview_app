import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Features/auth/core/widgets/auth_header.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
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
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeader(subtitle: s.forget_password_subtitle),
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
            SizedBox(height: 24.h),
            AppGradientButton(
              label: s.reset_password,
              onPressed: () {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
                if (_formKey.currentState!.validate()) {
                  context.read<ForgetPasswordCubit>().forgetPasswordMethod(
                    email: _emailController.text,
                  );
                }
              },
              size: AppButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
