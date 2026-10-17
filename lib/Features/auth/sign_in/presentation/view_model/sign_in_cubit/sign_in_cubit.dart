import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit({required this.signInRepoImpl}) : super(SignInInitialState());

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

    if (isClosed) return;
    result.fold(
      (error) => emit(SignInErrorState(errMessage: error.errorMessage)),
      (user) async {
        bool isVerified = await getIt<AuthService>().isEmailVerified();
        if (isClosed) return;
        if (isVerified) {
          emit(SignInSuccessState(user: user));
        } else {
          emit(SignInEmailNotVerifiedState());
        }
      },
    );
  }

  Future<void> resendVerificationEmail() async {
    try {
      await getIt<AuthService>().sendVerificationEmail();
      if (isClosed) return;
      emit(SignInVerificationEmailSentState());
    } catch (e) {
      if (isClosed) return;
      emit(SignInErrorState(errMessage: e.toString()));
    }
  }

  Future<void> signInWithGoogleMethod() async {
    emit(SignInLoadingState());
    var result = await signInRepoImpl.signInWithGoogleMethod();
    if (isClosed) return;
    result.fold(
      (error) {
        if (isClosed) return;
        if (error is CancelFailure) {
          emit(SignInInitialState());
          return;
        }
        emit(SignInErrorState(errMessage: error.errorMessage));
      },
      (user) {
        if (!isClosed) emit(SignInSuccessState(user: user));
      },
    );
  }

  Future<void> signInWithAppleMethod() async {
    emit(SignInLoadingState());
    var result = await signInRepoImpl.signInWithAppleMethod();
    if (isClosed) return;
    result.fold(
      (error) {
        if (isClosed) return;
        if (error is CancelFailure) {
          emit(SignInInitialState());
          return;
        }
        emit(SignInErrorState(errMessage: error.errorMessage));
      },
      (user) {
        if (!isClosed) emit(SignInSuccessState(user: user));
      },
    );
  }
}
