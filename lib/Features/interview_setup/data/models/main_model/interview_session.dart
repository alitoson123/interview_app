import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';

class InterviewSessionModel {
  final String id;
  final InterviewSetupModel config;
  final List<InterviewQuestionsModel> questions;
  final DateTime createdAt;
  final InterviewStatus status;

  const InterviewSessionModel({
    required this.id,
    required this.config,
    required this.questions,
    required this.createdAt,
    required this.status,
  });

  InterviewSessionModel copyWith({
    String? id,
    InterviewSetupModel? config,
    List<InterviewQuestionsModel>? questions,
    DateTime? createdAt,
    InterviewStatus? status,
  }) {
    return InterviewSessionModel(
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
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
    };
  }

  factory InterviewSessionModel.fromFirestore({
    required Map<dynamic, dynamic> data,
  }) {
    final rawCreatedAt = data['createdAt'];
    DateTime parsedCreatedAt;
    if (rawCreatedAt is Timestamp) {
      parsedCreatedAt = rawCreatedAt.toDate();
    } else if (rawCreatedAt is DateTime) {
      parsedCreatedAt = rawCreatedAt;
    } else if (rawCreatedAt is String) {
      parsedCreatedAt = DateTime.tryParse(rawCreatedAt) ?? DateTime.now();
    } else if (rawCreatedAt is int) {
      parsedCreatedAt = DateTime.fromMillisecondsSinceEpoch(rawCreatedAt);
    } else {
      parsedCreatedAt = DateTime.now();
    }

    final questionsRaw = data['questions'] as List<dynamic>? ?? [];
    return InterviewSessionModel(
      id: data['id']?.toString() ?? '',
      config: InterviewSetupModel.fromFirestore(
        data: Map<String, dynamic>.from(data),
      ),
      questions: questionsRaw.map((question) {
        return InterviewQuestionsModel.fromMap(
          Map<String, dynamic>.from(question as Map),
        );
      }).toList(),
      createdAt: parsedCreatedAt,
      status: InterviewStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => InterviewStatus.inProgress,
      ),
    );
  }
}

enum InterviewStatus { inProgress, completed }
