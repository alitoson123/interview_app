import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            SignUpCubit(signUpRepoImpl: getIt<SignUpRepoImpl>()),
        child: const SignUpViewBody(),
      ),
    );
  }
}
