import 'package:interview_app/Core/services/interview_service/interview_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewRemoteDataSource {
  final InterviewService interviewService;

  InterviewRemoteDataSource({required this.interviewService});

  Future<InterviewSessionModel> generateInterview({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    return await interviewService.generateInterview(
      interviewSetupModel: interviewSetupModel,
    );
  }

  Future<void> updateInterviewSession({
    required InterviewSessionModel session,
  }) async {
    await interviewService.updateInterviewSession(session: session);
  }
}
