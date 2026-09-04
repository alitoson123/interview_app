import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewLocalDataSource {
  final GeneralLocalService generalLocalService;

  InterviewLocalDataSource({required this.generalLocalService});

  static bool _isHiveInterviewInitialized = false;

  Future<void> initHive() async {
    if (_isHiveInterviewInitialized) return;
    await Hive.initFlutter();

    Hive.registerAdapter(InterviewSetupModelAdapter());

    await Hive.openBox<InterviewSetupModel>(AppConstant.interviewBox);
    _isHiveInterviewInitialized = true;
  }

  Future<void> saveInterviewSetup({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    await generalLocalService.add<InterviewSetupModel>(
      AppConstant.interviewBox,
      interviewSetupModel,
    );
  }

  Future<List<InterviewSetupModel>> getInterviewSetup() async {
    return await generalLocalService.getAll<InterviewSetupModel>(
      AppConstant.interviewBox,
    );
  }

  Future<void> deleteInterviewSetup() async {
    await generalLocalService.clearBox<InterviewSetupModel>(
      AppConstant.interviewBox,
    );
  }
}
