import 'package:interview_app/Features/interview_setup/data/models/difficulty.dart';
import 'package:interview_app/Features/interview_setup/data/models/experience_level.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_type.dart';
import 'package:interview_app/Features/interview_setup/data/models/technology_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/track_model.dart';

class InterviewSetupModel {
  final TrackModel track;
  final TechnologyModel? technology;
  final ExperienceLevel experience;
  final String? jobDescription;
  final InterviewType type;
  final Difficulty difficulty;

  const InterviewSetupModel({
    required this.track,
    required this.technology,
    required this.experience,
    required this.jobDescription,
    required this.type,
    required this.difficulty,
  });

  factory InterviewSetupModel.empty({required TrackModel track}) {
    return InterviewSetupModel(
      track: track,
      technology: null,
      experience: ExperienceLevel.junior,
      jobDescription: null,
      type: InterviewType.technical,
      difficulty: Difficulty.medium,
    );
  }

  InterviewSetupModel copyWith({
    TrackModel? track,
    TechnologyModel? technology,
    ExperienceLevel? experience,
    String? jobDescription,
    InterviewType? type,
    Difficulty? difficulty,
  }) {
    return InterviewSetupModel(
      track: track ?? this.track,
      technology: technology ?? this.technology,
      experience: experience ?? this.experience,
      jobDescription: jobDescription ?? this.jobDescription,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
