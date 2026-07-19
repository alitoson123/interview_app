import 'package:flutter/material.dart';

enum ExperienceLevel {
  beginner(
    title: 'Beginner',
    subtitle: '0–1 years · fundamentals',
    icon: Icons.bar_chart,
    color: Color(0xFF22B57A),
  ),
  junior(
    title: 'Junior',
    subtitle: '1–3 years · shipping features',
    icon: Icons.work_outline,
    color: Color(0xFFFF9800),
  ),
  midLevel(
    title: 'Mid-Level',
    subtitle: '3–5 years · owns modules',
    icon: Icons.rocket_launch_outlined,
    color: Color(0xFF673AB7),
  ),
  senior(
    title: 'Senior',
    subtitle: '5+ years · leads architecture',
    icon: Icons.military_tech_outlined,
    color: Color(0xFFE91E63),
  );

  const ExperienceLevel({
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
