import 'package:interview_app/Core/services/database_service/interview_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewRemoteDataSource {
  final InterviewService interviewService;

  InterviewRemoteDataSource({required this.interviewService});

  Future<void> createInterviewSetup({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    await interviewService.createInterviewSetup(
      interviewSetupModel: interviewSetupModel,
    );
  }
}
