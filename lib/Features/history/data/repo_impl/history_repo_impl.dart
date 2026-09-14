import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/history/data/data_source/history_remote_data_source.dart';
import 'package:interview_app/Features/history/domain/repo/history_repo.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryRepoImpl extends HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepoImpl({required this.historyRemoteDataSource});

  @override
  Future<Either<Failure, List<InterviewSession>>> getInterviewsHistory() async {
    try {
      final sessions = await historyRemoteDataSource.getInterviewsHistory();
      if (sessions == null) {
        return left(ServerFailure(errorMessage: "No sessions found"));
      }
      return right(sessions);
    } on FirebaseException catch (e) {
      return left(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteInterview({
    required String interviewId,
  }) async {
    try {
      await historyRemoteDataSource.deleteInterview(interviewId: interviewId);
      return right(null);
    } on FirebaseException catch (e) {
      return left(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
