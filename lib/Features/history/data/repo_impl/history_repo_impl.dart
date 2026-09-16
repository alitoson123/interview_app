import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/history/data/data_source/history_local_data_source.dart';
import 'package:interview_app/Features/history/data/data_source/history_remote_data_source.dart';
import 'package:interview_app/Features/history/domain/repo/history_repo.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryRepoImpl extends HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;
  final HistoryLocalDataSource historyLocalDataSource;

  HistoryRepoImpl({
    required this.historyRemoteDataSource,
    required this.historyLocalDataSource,
  });

  @override
  Future<Either<Failure, List<InterviewSessionModel>>>
  getInterviewsHistory() async {
    try {
      final remoteSessions = await historyRemoteDataSource
          .getInterviewsHistory();
      if (remoteSessions != null) {
        await historyLocalDataSource.saveInterviewsHistory(remoteSessions);
        return right(remoteSessions);
      }
      final localSessions = await historyLocalDataSource.getInterviewsHistory();
      return right(localSessions);
    } on FirebaseException catch (e) {
      final localSessions = await historyLocalDataSource.getInterviewsHistory();
      if (localSessions.isNotEmpty) {
        return right(localSessions);
      }
      return left(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      final localSessions = await historyLocalDataSource.getInterviewsHistory();
      if (localSessions.isNotEmpty) {
        return right(localSessions);
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteInterview({
    required String interviewId,
  }) async {
    try {
      await historyLocalDataSource.deleteInterview(interviewId: interviewId);
      await historyRemoteDataSource.deleteInterview(interviewId: interviewId);
      return right(null);
    } on FirebaseException {
      // Local deletion is complete; Firestore deletes offline when queued
      return right(null);
    } catch (_) {
      return right(null);
    }
  }
}
