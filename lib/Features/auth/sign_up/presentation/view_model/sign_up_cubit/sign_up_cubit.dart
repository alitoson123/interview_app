import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit({required this.signUpRepoImpl}) : super(SignUpInitialState());

  final SignUpRepoImpl signUpRepoImpl;

  Future<void> signUpMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    var result = await signUpRepoImpl.signupMethod(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (error) => emit(SignUpErrorState(errMessage: error.errorMessage)),
      (user) async {
        await signUpRepoImpl.sendVerificationEmail();
        emit(SignUpSuccessState(user: user));
      },
    );
  }
}
