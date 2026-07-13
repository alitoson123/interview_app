import 'package:flutter/material.dart';
import 'package:interview_app/Core/theme/app_color.dart';

/// Elevation system — four levels of depth. Regular shadows use neutral-900
/// at low opacity; [glow] uses the brand primary for emphasis (FAB, logo,
/// primary CTAs).
abstract class AppShadows {
  AppShadows._();

  /// Hairline separation, resting chips.
  static final List<BoxShadow> sm = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.06),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  /// Default cards, list items.
  static final List<BoxShadow> soft = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.08),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.06),
      offset: const Offset(0, 2),
      blurRadius: 6,
      spreadRadius: -2,
    ),
  ];

  /// Modals, phone frame, popovers.
  static final List<BoxShadow> elevated = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.12),
      offset: const Offset(0, 20),
      blurRadius: 40,
      spreadRadius: -12,
    ),
  ];

  /// FAB, logo, primary CTAs.
  static final List<BoxShadow> glow = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.35),
      offset: const Offset(0, 10),
      blurRadius: 30,
      spreadRadius: -8,
    ),
  ];
}