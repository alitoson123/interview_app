import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewService {
  final DatabaseService databaseService;

  InterviewService({required this.databaseService});

  Future<void> createInterviewSetup({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final interviewRef = DatabaseService.firestoreInstance
        .collection(AppConstant.usersCollection)
        .doc(uid)
        .collection(AppConstant.interviewsCollection)
        .doc();

    final stampedModel = interviewSetupModel.copyWith(id: interviewRef.id);

    await interviewRef.set(stampedModel.toMap());
  }
}
