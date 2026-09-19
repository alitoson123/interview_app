import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

sealed class RecentInterviewState {
  const RecentInterviewState();
}

final class RecentInterviewInitial extends RecentInterviewState {
  const RecentInterviewInitial();
}

final class RecentInterviewLoading extends RecentInterviewState {
  const RecentInterviewLoading();
}

final class RecentInterviewLoaded extends RecentInterviewState {
  final InterviewSessionModel? session;

  const RecentInterviewLoaded({this.session});
}

final class RecentInterviewError extends RecentInterviewState {
  final String errorMessage;

  const RecentInterviewError({required this.errorMessage});
}
