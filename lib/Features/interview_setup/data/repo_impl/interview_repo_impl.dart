import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_local_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_remote_data_source.dart';
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
  Future<Either<Failure, void>> createInterviewSetup({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    try {
      await interviewRemoteDataSource.createInterviewSetup(
        interviewSetupModel: interviewSetupModel,
      );

      await interviewLocalDataSource.initHive();
      await interviewLocalDataSource.saveInterviewSetup(
        interviewSetupModel: interviewSetupModel,
      );

      return right(null);
    } on FirebaseException catch (e) {
      return left(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
