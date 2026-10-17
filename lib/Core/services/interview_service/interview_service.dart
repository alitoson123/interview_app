import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/domain/entities/interview_quota.dart';

class InterviewService {
  final DatabaseService databaseService;

  InterviewService({required this.databaseService});

  Future<InterviewSessionModel> generateInterview({
    required InterviewSetupModel interviewSetupModel,
  }) async {
    final callable = FirebaseFunctions.instance.httpsCallable(
      'generateInterview',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 120)),
    );

    final result = await callable.call({
      'trackTitle': interviewSetupModel.track,
      'technologyTitle': interviewSetupModel.technology,
      'experience': interviewSetupModel.experience.name,
      'interviewType': interviewSetupModel.interviewType.name,
      'difficulty': interviewSetupModel.difficulty.name,
      'jobDescription': interviewSetupModel.jobDescription,
    });

    final data = Map<String, dynamic>.from(result.data as Map);
    final interviewId = data['interviewId'] as String;
    final questionsRaw = data['questions'] as List<dynamic>;

    final questions = questionsRaw.map((q) {
      final qMap = Map<String, dynamic>.from(q as Map);
      return InterviewQuestionsModel.fromMap(qMap);
    }).toList();

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        await DatabaseService.firestoreInstance
            .collection(AppConstant.usersCollection)
            .doc(uid)
            .set(
          {'interviewsUsed': FieldValue.increment(1)},
          SetOptions(merge: true),
        );
      } catch (_) {}
    }

    return InterviewSessionModel(
      id: interviewId,
      config: interviewSetupModel.copyWith(id: interviewId),
      questions: questions,
      createdAt: DateTime.now(),
      status: InterviewStatus.inProgress,
    );
  }

  Future<void> updateInterviewSession({
    required InterviewSessionModel session,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final interviewRef = DatabaseService.firestoreInstance
        .collection(AppConstant.usersCollection)
        .doc(uid)
        .collection(AppConstant.interviewsCollection)
        .doc(session.id);

    await interviewRef.update({
      'questions': session.questions.map((q) => q.toMap()).toList(),
      'status': session.status.name,
      'completedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<InterviewQuota> getInterviewQuota() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return InterviewQuota.initial;

    try {
      final userDoc = await DatabaseService.firestoreInstance
          .collection(AppConstant.usersCollection)
          .doc(uid)
          .get();

      final data = userDoc.data();
      final limit = data?['interviewLimit'] as int? ?? 3;
      final recordedUsed = data?['interviewsUsed'] as int?;

      final countSnapshot = await DatabaseService.firestoreInstance
          .collection(AppConstant.usersCollection)
          .doc(uid)
          .collection(AppConstant.interviewsCollection)
          .count()
          .get();
      final actualCount = countSnapshot.count ?? 0;

      final used = (recordedUsed != null && recordedUsed >= actualCount)
          ? recordedUsed
          : actualCount;

      if (recordedUsed != used) {
        await DatabaseService.firestoreInstance
            .collection(AppConstant.usersCollection)
            .doc(uid)
            .set(
          {'interviewsUsed': used, 'interviewLimit': limit},
          SetOptions(merge: true),
        );
      }

      return InterviewQuota(used: used, limit: limit);
    } catch (_) {
      return InterviewQuota.initial;
    }
  }

  Stream<InterviewQuota> watchInterviewQuota() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return Stream.value(InterviewQuota.initial);
    }

    return DatabaseService.firestoreInstance
        .collection(AppConstant.usersCollection)
        .doc(uid)
        .snapshots()
        .map((userDoc) {
      if (!userDoc.exists) return InterviewQuota.initial;
      final data = userDoc.data();
      if (data == null) return InterviewQuota.initial;

      final limit = data['interviewLimit'] as int? ?? 3;
      final used = data['interviewsUsed'] as int? ?? 0;

      return InterviewQuota(used: used, limit: limit);
    });
  }
}
