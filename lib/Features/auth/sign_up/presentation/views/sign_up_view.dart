import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/view_model/sing_up_cubit/sign_up_cubit.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interview_app/Core/helpers/message.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_states.dart';
import 'package:interview_app/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            SignUpCubit(signUpRepoImpl: getIt<SignUpRepoImpl>()),
        child: BlocListener<SingInCubit, SignInStates>(
          listener: (context, state) {
            if (state is SignInSuccessState) {
              EasyLoading.dismiss();
              Message.MessageSuccessMethod(
                context,
                message: S.of(context).login_success,
              );
              GoRouter.of(context).go(AppRoutes.homeScreen);
            } else if (state is SignInErrorState) {
              EasyLoading.dismiss();
              Message.showAppDialog(
                context: context,
                message: state.errMessage,
                type: DialogType.error,
              );
            } else if (state is SignInLoadingState) {
              EasyLoading.show(status: S.of(context).signing_in);
            }
          },
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
