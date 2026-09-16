import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class HistoryService {
  Future<List<InterviewSessionModel>?> getInterviewsHistory() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final snapshot = await DatabaseService.firestoreInstance
        .collection(AppConstant.usersCollection)
        .doc(uid)
        .collection(AppConstant.interviewsCollection)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return InterviewSessionModel.fromFirestore(data: data);
    }).toList();
  }

  Future<void> deleteInterview({required String interviewId}) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception('User is not authenticated');

    await DatabaseService.firestoreInstance
        .collection(AppConstant.usersCollection)
        .doc(uid)
        .collection(AppConstant.interviewsCollection)
        .doc(interviewId)
        .delete();
  }
}
