import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/history/domain/repo/history_repo.dart';
import 'package:interview_app/Features/history/presentation/view_model/history_cubit/history_state.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo historyRepo;

  HistoryCubit({required this.historyRepo}) : super(HistoryInitial());

  Future<void> fetchHistory() async {
    emit(HistoryLoading());
    final result = await historyRepo.getInterviewsHistory();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(HistoryError(errorMessage: failure.errorMessage));
        }
      },
      (interviews) {
        if (!isClosed) {
          emit(
            HistorySuccess(
              allInterviews: interviews,
              filteredInterviews: interviews,
              currentFilter: HistoryFilter.all,
            ),
          );
        }
      },
    );
  }

  void changeFilter(HistoryFilter filter) {
    if (isClosed || state is! HistorySuccess) return;
    final currentState = state as HistorySuccess;
    final filtered = _applyFilter(currentState.allInterviews, filter);
    emit(
      currentState.copyWith(
        filteredInterviews: filtered,
        currentFilter: filter,
      ),
    );
  }

  Future<void> deleteInterview(String interviewId) async {
    if (state is! HistorySuccess) return;
    final currentState = state as HistorySuccess;

    final result = await historyRepo.deleteInterview(interviewId: interviewId);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(HistoryError(errorMessage: failure.errorMessage));
        }
      },
      (_) {
        if (!isClosed) {
          final updatedAll = currentState.allInterviews
              .where((item) => item.id != interviewId)
              .toList();
          final updatedFiltered = _applyFilter(
            updatedAll,
            currentState.currentFilter,
          );
          emit(
            currentState.copyWith(
              allInterviews: updatedAll,
              filteredInterviews: updatedFiltered,
            ),
          );
        }
      },
    );
  }

  List<InterviewSessionModel> _applyFilter(
    List<InterviewSessionModel> interviews,
    HistoryFilter filter,
  ) {
    switch (filter) {
      case HistoryFilter.all:
        return interviews;
      case HistoryFilter.inProgress:
        return interviews
            .where((i) => i.status == InterviewStatus.inProgress)
            .toList();
      case HistoryFilter.completed:
        return interviews
            .where((i) => i.status == InterviewStatus.completed)
            .toList();
    }
  }
}
