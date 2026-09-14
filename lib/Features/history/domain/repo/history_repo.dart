import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

abstract class HistoryRepo {
  Future<Either<Failure, List<InterviewSession>>> getInterviewsHistory();
  Future<Either<Failure, void>> deleteInterview({required String interviewId});
}
