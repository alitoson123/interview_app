import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/history/domain/repo/history_repo.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_state.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class RecentInterviewCubit extends Cubit<RecentInterviewState> {
  final HistoryRepo historyRepo;

  RecentInterviewCubit({required this.historyRepo})
      : super(const RecentInterviewInitial());

  Future<void> fetchRecentInProgressInterview() async {
    emit(const RecentInterviewLoading());
    final result = await historyRepo.getInterviewsHistory();
    result.fold(
      (failure) => emit(RecentInterviewError(errorMessage: failure.errorMessage)),
      (sessions) {
        final inProgressSession = sessions
            .where((s) => s.status == InterviewStatus.inProgress)
            .firstOrNull;
        emit(RecentInterviewLoaded(session: inProgressSession));
      },
    );
  }
}
