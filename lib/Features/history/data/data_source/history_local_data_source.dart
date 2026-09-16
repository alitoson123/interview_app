import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryLocalDataSource {
  final GeneralLocalService generalLocalService;

  HistoryLocalDataSource({required this.generalLocalService});

  Future<List<InterviewSessionModel>> getInterviewsHistory() async {
    final rawList = await generalLocalService.getAll<Map>(
      AppConstant.interviewSessionsBox,
    );
    final sessions = rawList.map((map) {
      return InterviewSessionModel.fromFirestore(data: map);
    }).toList();

    sessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sessions;
  }

  Future<void> saveInterviewsHistory(
    List<InterviewSessionModel> sessions,
  ) async {
    for (final session in sessions) {
      await generalLocalService.put<Map>(
        AppConstant.interviewSessionsBox,
        session.id,
        session.toMap(),
      );
    }
  }

  Future<void> deleteInterview({required String interviewId}) async {
    await generalLocalService.delete<Map>(
      AppConstant.interviewSessionsBox,
      interviewId,
    );
  }
}
