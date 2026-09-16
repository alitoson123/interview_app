import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_local_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_remote_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/domain/repo/interview_repo.dart';

class InterviewRepoImpl extends InterviewRepo {
  final InterviewRemoteDataSource interviewRemoteDataSource;
  final InterviewLocalDataSource interviewLocalDataSource;

  InterviewRepoImpl({
    required this.interviewRemoteDataSource,
    required this.interviewLocalDataSource,
  });

  @override
  Future<Either<Failure, InterviewSessionModel>> generateInterview({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    try {
      final session = await interviewRemoteDataSource.generateInterview(
        interviewSetupModel: interviewSetupModel,
      );
      await interviewLocalDataSource.saveInterviewSession(session);
      return right(session);
    } on FirebaseFunctionsException catch (e) {
      return left(
        ServerFailure(errorMessage: e.message ?? 'Generation failed'),
      );
    } on FirebaseException catch (e) {
      return left(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateInterviewSession({
    required InterviewSessionModel session,
  }) async {
    try {
      await interviewLocalDataSource.saveInterviewSession(session);
      await interviewRemoteDataSource.updateInterviewSession(session: session);
      return right(null);
    } on FirebaseException {
      // Local save already succeeded; Firestore buffers write offline
      return right(null);
    } catch (_) {
      // Fallback: local session is safely stored
      return right(null);
    }
  }
}
