import 'package:interview_app/Core/services/interview_service/history_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryRemoteDataSource {
  final HistoryService historyService;

  HistoryRemoteDataSource({required this.historyService});

  Future<List<InterviewSession>?> getInterviewsHistory() async {
    return await historyService.getInterviewsHistory();
  }

  Future<void> deleteInterview({required String interviewId}) async {
    await historyService.deleteInterview(interviewId: interviewId);
  }
}
