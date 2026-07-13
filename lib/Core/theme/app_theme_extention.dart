import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/theme/app_color.dart';


/// Design tokens with no native slot in `ThemeData` — feedback colors beyond
/// error (success/warning), the brand gradient, and the elevation ramp.
///
/// Usage:
/// ```dart
/// final tokens = Theme.of(context).extension<AppThemeExtension>()!;
/// Container(color: tokens.success, ...)
/// ```
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.success,
    required this.warning,
    required this.primaryGlow,
    required this.primaryGradient,
    required this.shadowSm,
    required this.shadowSoft,
    required this.shadowElevated,
    required this.shadowGlow,
    required this.durationInstant,
    required this.durationFast,
    required this.durationBase,
    required this.durationSlow,
  });

  final Color success;
  final Color warning;
  final Color primaryGlow;
  final List<Color> primaryGradient;
  final List<BoxShadow> shadowSm;
  final List<BoxShadow> shadowSoft;
  final List<BoxShadow> shadowElevated;
  final List<BoxShadow> shadowGlow;
  final Duration durationInstant;
  final Duration durationFast;
  final Duration durationBase;
  final Duration durationSlow;

  /// Feedback colors and shadow levels are identical across modes; only
  /// surface/text tokens (already in `ColorScheme`) differ.
  static final AppThemeExtension light = AppThemeExtension(
    success: AppColors.success,
    warning: AppColors.warning,
    primaryGlow: AppColors.primaryGlow,
    primaryGradient: AppColors.primaryGradient,
    shadowSm: AppShadows.sm,
    shadowSoft: AppShadows.soft,
    shadowElevated: AppShadows.elevated,
    shadowGlow: AppShadows.glow,
    durationInstant: const Duration(milliseconds: 100),
    durationFast: const Duration(milliseconds: 150),
    durationBase: const Duration(milliseconds: 220),
    durationSlow: const Duration(milliseconds: 320),
  );

  static final AppThemeExtension dark = light;

  @override
  AppThemeExtension copyWith({
    Color? success,
    Color? warning,
    Color? primaryGlow,
    List<Color>? primaryGradient,
    List<BoxShadow>? shadowSm,
    List<BoxShadow>? shadowSoft,
    List<BoxShadow>? shadowElevated,
    List<BoxShadow>? shadowGlow,
    Duration? durationInstant,
    Duration? durationFast,
    Duration? durationBase,
    Duration? durationSlow,
  }) {
    return AppThemeExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      primaryGlow: primaryGlow ?? this.primaryGlow,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      shadowSm: shadowSm ?? this.shadowSm,
      shadowSoft: shadowSoft ?? this.shadowSoft,
      shadowElevated: shadowElevated ?? this.shadowElevated,
      shadowGlow: shadowGlow ?? this.shadowGlow,
      durationInstant: durationInstant ?? this.durationInstant,
      durationFast: durationFast ?? this.durationFast,
      durationBase: durationBase ?? this.durationBase,
      durationSlow: durationSlow ?? this.durationSlow,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    // These are discrete design tokens, not interpolable visual properties —
    // snap at the midpoint rather than blending colors/shadows.
    return t < 0.5 ? this : other;
  }
}