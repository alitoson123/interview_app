import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:interview_app/Features/auth/forget_password/presentation/view_model/forget_password_cubit/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit({required this.forgetPasswordRepo})
    : super(ForgetPasswordInitialState());

  final ForgetPasswordRepo forgetPasswordRepo;

  Future<void> forgetPasswordMethod({required String email}) async {
    emit(ForgetPasswordLoadingState());
    var result = await forgetPasswordRepo.forgetPasswordMethod(
      email: email,
    );

    result.fold(
      (error) => emit(ForgetPasswordErrorState(errMessage: error.errorMessage)),
      (_) => emit(ForgetPasswordSuccessState()),
    );
  }
}
