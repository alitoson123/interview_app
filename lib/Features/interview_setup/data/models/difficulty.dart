import 'package:flutter/material.dart';

enum Difficulty {
  easy(
    title: 'Easy',
    subtitle: 'Warm-up · concept checks',
    icon: Icons.bolt,
    color: Color(0xFF22B57A),
  ),
  medium(
    title: 'Medium',
    subtitle: 'Realistic on-site pace',
    icon: Icons.bolt,
    color: Color(0xFFFF9800),
  ),
  hard(
    title: 'Hard',
    subtitle: 'FAANG-tier · deep follow-ups',
    icon: Icons.bolt,
    color: Color(0xFFE5484D),
  );

  const Difficulty({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}
