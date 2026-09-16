import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

abstract class InterviewRepo {
  Future<Either<Failure, InterviewSessionModel>> generateInterview({
    required InterviewSetupModel interviewSetupModel,
  });

  Future<Either<Failure, void>> updateInterviewSession({
    required InterviewSessionModel session,
  });
}
