import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewSession {
  final String id;
  final InterviewSetupModel config;
  final List<InterviewQuestionsModel> questions;
  final DateTime createdAt;
  final InterviewStatus status;

  const InterviewSession({
    required this.id,
    required this.config,
    required this.questions,
    required this.createdAt,
    required this.status,
  });

  factory InterviewSession.fromFirestore({
    required Map<String, dynamic> data,
  }) {
    return InterviewSession(
      id: data['id'],
      config: InterviewSetupModel.fromFirestore(data: data['config']),
      questions: (data['questions'] as List<dynamic>).map((question) {
        return InterviewQuestionsModel.fromMap(question);
      }).toList(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      status: InterviewStatus.values.firstWhere((e) {
        return e.name == data['status'];
      }),
    );
  }
}

enum InterviewStatus { inProgress, completed }
