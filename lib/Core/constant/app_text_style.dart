import 'package:flutter/material.dart';

/// Font families. Add the actual font assets under `assets/fonts/` and
/// register them in `pubspec.yaml` with these exact family names, or swap
/// to `google_fonts` (GoogleFonts.plusJakartaSans(), GoogleFonts.jetBrainsMono()).
abstract class AppFonts {
  AppFonts._();
  static const String primary = 'Plus Jakarta Sans';
  static const String mono = 'JetBrains Mono';
}

/// Type scale — AceInterview Design System v1.0.
///
/// Styles are intentionally colorless (color is applied by [AppTheme]'s
/// `TextTheme` or via `.copyWith(color: ...)` at the call site) so the same
/// scale works for both light and dark mode.
abstract class AppTextStyles {
  AppTextStyles._();

  static const TextStyle displayL = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 48,
    height: 52 / 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.02 * 48,
  );

  static const TextStyle displayM = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 40,
    height: 44 / 40,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.02 * 40,
  );

  static const TextStyle headlineL = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 32,
    height: 38 / 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.01 * 32,
  );

  static const TextStyle headlineM = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    height: 30 / 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.01 * 24,
  );

  static const TextStyle titleL = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20,
    height: 26 / 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleM = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 17,
    height: 24 / 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyL = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyM = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelL = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    height: 18 / 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.02 * 13,
  );

  static const TextStyle labelM = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.12 * 11,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 10,
    height: 14 / 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02 * 10,
  );

  // Monospace — timers, code snippets, token / badge labels.
  static const TextStyle monoM = TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle monoLabel = TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
  );
}