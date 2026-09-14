import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

abstract class GenerateInterviewState {}

class GenerateInterviewInitial extends GenerateInterviewState {}

class GenerateInterviewLoading extends GenerateInterviewState {}

class GenerateInterviewSuccess extends GenerateInterviewState {
  final InterviewSession session;

  GenerateInterviewSuccess({required this.session});
}

class GenerateInterviewError extends GenerateInterviewState {
  final String errMessage;

  GenerateInterviewError({required this.errMessage});
}
