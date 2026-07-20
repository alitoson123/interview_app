import 'package:flutter/material.dart';
import 'package:interview_app/generated/l10n.dart';

enum Difficulty {
  easy(
    icon: Icons.bolt,
    color: Color(0xFF22B57A),
  ),
  medium(
    icon: Icons.bolt,
    color: Color(0xFFFF9800),
  ),
  hard(
    icon: Icons.bolt,
    color: Color(0xFFE5484D),
  );

  const Difficulty({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  String getTitle(S s) {
    switch (this) {
      case Difficulty.easy:
        return s.difficultyEasy;
      case Difficulty.medium:
        return s.difficultyMedium;
      case Difficulty.hard:
        return s.difficultyHard;
    }
  }

  String getSubtitle(S s) {
    switch (this) {
      case Difficulty.easy:
        return s.difficultyEasySub;
      case Difficulty.medium:
        return s.difficultyMediumSub;
      case Difficulty.hard:
        return s.difficultyHardSub;
    }
  }
}
