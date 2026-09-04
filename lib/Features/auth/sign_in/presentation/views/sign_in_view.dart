import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/helpers/message.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_states.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/widgets/sign_in_view_body.dart';
import 'package:interview_app/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key, this.signInParams});
  final (String email, String password)? signInParams;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<SignInCubit, SignInStates>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            EasyLoading.dismiss();
            Message.messageSuccessMethod(
              context,
              message: S.of(context).login_success,
            );
            GoRouter.of(context).go(AppRoutes.homeScreen);
          } else if (state is SignInEmailNotVerifiedState) {
            EasyLoading.dismiss();
            Message.showAppDialog(
              context: context,
              message: S.of(context).email_not_verified,
              type: DialogType.error,
              isVerifyButton: true,
              onVerifyPressed: () {
                context.read<SignInCubit>().resendVerificationEmail();
              },
            );
          } else if (state is SignInVerificationEmailSentState) {
            EasyLoading.dismiss();
            Message.messageSuccessMethod(
              context,
              message: S.of(context).Email_has_been_sent_successfully,
            );
          } else if (state is SignInErrorState) {
            EasyLoading.dismiss();
            Message.showAppDialog(
              context: context,
              message: state.errMessage,
              type: DialogType.error,
            );
          } else if (state is SignInLoadingState) {
            EasyLoading.show(status: S.of(context).signing_in);
          } else if (state is SignInInitialState) {
            EasyLoading.dismiss();
          }
        },
        child: SignInViewBody(signInParams: signInParams),
      ),
    );
  }
}
