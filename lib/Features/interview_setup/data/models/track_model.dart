import 'package:flutter/material.dart';
import 'technology_model.dart';

class TrackModel {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool requiresTechnologySelection;
  final List<TechnologyModel> technologies;

  const TrackModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.requiresTechnologySelection = false,
    this.technologies = const [],
  });
}
