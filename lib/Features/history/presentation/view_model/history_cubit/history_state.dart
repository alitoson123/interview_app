import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

enum HistoryFilter { all, inProgress, completed }

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<InterviewSession> allInterviews;
  final List<InterviewSession> filteredInterviews;
  final HistoryFilter currentFilter;

  HistorySuccess({
    required this.allInterviews,
    required this.filteredInterviews,
    required this.currentFilter,
  });

  HistorySuccess copyWith({
    List<InterviewSession>? allInterviews,
    List<InterviewSession>? filteredInterviews,
    HistoryFilter? currentFilter,
  }) {
    return HistorySuccess(
      allInterviews: allInterviews ?? this.allInterviews,
      filteredInterviews: filteredInterviews ?? this.filteredInterviews,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }
}

class HistoryError extends HistoryState {
  final String errorMessage;

  HistoryError({required this.errorMessage});
}
