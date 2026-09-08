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

  InterviewSession copyWith({
    String? id,
    InterviewSetupModel? config,
    List<InterviewQuestionsModel>? questions,
    DateTime? createdAt,
    InterviewStatus? status,
  }) {
    return InterviewSession(
      id: id ?? this.id,
      config: config ?? this.config,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'config': config.toMap()['config'],
      'questions': questions.map((question) => question.toMap()).toList(),
      'createdAt': Timestamp.fromDate(createdAt),
      'status': status.name,
    };
  }

  factory InterviewSession.fromFirestore({
    required Map<String, dynamic> data,
  }) {
    return InterviewSession(
      id: data['id'] ?? '',
      config: InterviewSetupModel.fromFirestore(data: data),
      questions: (data['questions'] as List<dynamic>? ?? []).map((question) {
        return InterviewQuestionsModel.fromMap(question as Map<String, dynamic>);
      }).toList(),
      createdAt: data['createdAt'] is Timestamp
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      status: InterviewStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => InterviewStatus.inProgress,
      ),
    );
  }
}

enum InterviewStatus { inProgress, completed }
