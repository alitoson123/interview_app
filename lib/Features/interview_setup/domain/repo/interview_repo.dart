import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

abstract class InterviewRepo {
  Future<Either<Failure,void>> createInterviewSetup({
    required InterviewSetupModel interviewSetupModel,
  });
}
