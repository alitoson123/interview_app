import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewLocalDataSource {
  final GeneralLocalService generalLocalService;

  InterviewLocalDataSource({required this.generalLocalService});

  static bool _isHiveInterviewInitialized = false;

  Future<void> initHive() async {
    if (_isHiveInterviewInitialized) return;
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(InterviewSetupModelAdapter());
    }

    await Hive.openBox<InterviewSetupModel>(AppConstant.interviewBox);
    await Hive.openBox<Map>(AppConstant.interviewSessionsBox);
    _isHiveInterviewInitialized = true;
  }

  Future<void> saveInterviewSession(InterviewSessionModel session) async {
    await generalLocalService.put<Map>(
      AppConstant.interviewSessionsBox,
      session.id,
      session.toMap(),
    );
  }

  Future<void> saveAllInterviewSessions(
    List<InterviewSessionModel> sessions,
  ) async {
    for (final session in sessions) {
      await saveInterviewSession(session);
    }
  }

  Future<InterviewSessionModel?> getInterviewSession(String id) async {
    final data = await generalLocalService.get<Map>(
      AppConstant.interviewSessionsBox,
      id,
    );
    if (data == null) return null;
    return InterviewSessionModel.fromFirestore(data: data);
  }

  Future<List<InterviewSessionModel>> getAllInterviewSessions() async {
    final rawList = await generalLocalService.getAll<Map>(
      AppConstant.interviewSessionsBox,
    );
    final sessions = rawList.map((map) {
      return InterviewSessionModel.fromFirestore(data: map);
    }).toList();

    sessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sessions;
  }

  Future<void> deleteInterviewSession(String id) async {
    await generalLocalService.delete<Map>(AppConstant.interviewSessionsBox, id);
  }
}
