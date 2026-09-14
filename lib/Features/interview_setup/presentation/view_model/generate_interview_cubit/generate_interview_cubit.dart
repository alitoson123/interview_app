import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/domain/repo/interview_repo.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_state.dart';

class GenerateInterviewCubit extends Cubit<GenerateInterviewState> {
  final InterviewRepo interviewRepo;

  GenerateInterviewCubit({required this.interviewRepo})
      : super(GenerateInterviewInitial());

  Future<void> generateInterview({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    emit(GenerateInterviewLoading());

    final result = await interviewRepo.generateInterview(
      interviewSetupModel: interviewSetupModel,
    );

    result.fold(
      (failure) => emit(GenerateInterviewError(errMessage: failure.errorMessage)),
      (session) => emit(GenerateInterviewSuccess(session: session)),
    );
  }
}
