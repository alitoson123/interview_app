import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/Features/interview_setup/data/models/difficulty.dart';
import 'package:interview_app/Features/interview_setup/data/models/experience_level.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_type.dart';

part 'interview_setup_model.g.dart';

@HiveType(typeId: 1)
class InterviewSetupModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String track;
  @HiveField(2)
  final String? technology;
  @HiveField(3)
  final ExperienceLevel experience;
  @HiveField(4)
  final String? jobDescription;
  @HiveField(5)
  final InterviewType interviewType;
  @HiveField(6)
  final Difficulty difficulty;

  const InterviewSetupModel({
    required this.id,
    required this.track,
    required this.technology,
    required this.experience,
    required this.jobDescription,
    required this.interviewType,
    required this.difficulty,
  });

  factory InterviewSetupModel.empty({required String track}) {
    return InterviewSetupModel(
      id: '',
      track: track,
      technology: null,
      experience: ExperienceLevel.junior,
      jobDescription: null,
      interviewType: InterviewType.technical,
      difficulty: Difficulty.medium,
    );
  }

  InterviewSetupModel copyWith({
    String? id,
    String? track,
    String? technology,
    ExperienceLevel? experience,
    String? jobDescription,
    InterviewType? interviewType,
    Difficulty? difficulty,
  }) {
    return InterviewSetupModel(
      id: id ?? this.id,
      track: track ?? this.track,
      technology: technology ?? this.technology,
      experience: experience ?? this.experience,
      jobDescription: jobDescription ?? this.jobDescription,
      interviewType: interviewType ?? this.interviewType,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'config': {
        'trackTitle': track,
        'technologyTitle': technology,
        'experience': experience.name,
        'interviewType': interviewType.name,
        'difficulty': difficulty.name,
        'jobDescription': jobDescription,
      },
    };
  }

  factory InterviewSetupModel.fromFirestore({
    required Map<String, dynamic> data,
  }) {
    final dynamic rawConfig = data['config'];
    final config = rawConfig is Map
        ? Map<String, dynamic>.from(rawConfig)
        : data;
    return InterviewSetupModel(
      id: data['id']?.toString() ?? '',
      track: config['trackTitle']?.toString() ?? '',
      technology: config['technologyTitle']?.toString(),
      experience: ExperienceLevel.values.firstWhere(
        (e) => e.name == config['experience'],
        orElse: () => ExperienceLevel.junior,
      ),
      jobDescription: config['jobDescription']?.toString(),
      interviewType: InterviewType.values.firstWhere(
        (e) => e.name == config['interviewType'],
        orElse: () => InterviewType.technical,
      ),
      difficulty: Difficulty.values.firstWhere(
        (e) => e.name == config['difficulty'],
        orElse: () => Difficulty.medium,
      ),
    );
  }
}
