import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/helpers/message.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/Features/auth/forget_password/data/repo_impl/forget_password_repo_impl.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/view_model/forget_password_cubit/forget_password_states.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/widgets/forget_password_view_body.dart';
import 'package:interview_app/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        forgetPasswordRepo: getIt<ForgetPasswordRepoImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              EasyLoading.dismiss();
              Message.messageSuccessMethod(
                context,
                message: S.of(context).password_reset_email_sent,
              );
              GoRouter.of(context).go(AppRoutes.signInScreen);
            } else if (state is ForgetPasswordErrorState) {
              EasyLoading.dismiss();
              Message.showAppDialog(
                context: context,
                message: state.errMessage,
                type: DialogType.error,
              );
            } else if (state is ForgetPasswordLoadingState) {
              EasyLoading.show(status: S.of(context).loading);
            }
          },
          child: const ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
