import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_states.dart';

class SingInCubit extends Cubit<SignInStates> {
  SingInCubit({required this.signInRepoImpl}) : super(SignInInitialState());

  final SignInRepoImpl signInRepoImpl;

  Future<void> signInMethod({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    var result = await signInRepoImpl.signInMethod(
      email: email,
      password: password,
    );

    result.fold(
      (error) => emit(SignInErrorState(errMessage: error.errorMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }

  Future<void> signInWithGoogleMethod() async {
    emit(SignInLoadingState());
    var result = await signInRepoImpl.signInWithGoogleMethod();
    result.fold(
      (error) => emit(SignInErrorState(errMessage: error.errorMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }

  Future<void> signInWithAppleMethod() async {
    emit(SignInLoadingState());
    var result = await signInRepoImpl.signInWithAppleMethod();
    result.fold(
      (error) => emit(SignInErrorState(errMessage: error.errorMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }


}
