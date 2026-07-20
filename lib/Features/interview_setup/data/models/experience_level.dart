import 'package:flutter/material.dart';
import 'package:interview_app/generated/l10n.dart';

enum ExperienceLevel {
  beginner(
    icon: Icons.bar_chart,
    color: Color(0xFF22B57A),
  ),
  junior(
    icon: Icons.work_outline,
    color: Color(0xFFFF9800),
  ),
  midLevel(
    icon: Icons.rocket_launch_outlined,
    color: Color(0xFF673AB7),
  ),
  senior(
    icon: Icons.military_tech_outlined,
    color: Color(0xFFE91E63),
  );

  const ExperienceLevel({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  String getTitle(S s) {
    switch (this) {
      case ExperienceLevel.beginner:
        return s.experienceBeginner;
      case ExperienceLevel.junior:
        return s.experienceJunior;
      case ExperienceLevel.midLevel:
        return s.experienceMid;
      case ExperienceLevel.senior:
        return s.experienceSenior;
    }
  }

  String getSubtitle(S s) {
    switch (this) {
      case ExperienceLevel.beginner:
        return s.experienceBeginnerSub;
      case ExperienceLevel.junior:
        return s.experienceJuniorSub;
      case ExperienceLevel.midLevel:
        return s.experienceMidSub;
      case ExperienceLevel.senior:
        return s.experienceSeniorSub;
    }
  }
}
