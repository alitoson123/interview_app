import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static TextStyle get displayL => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 48.sp,
    height: 52 / 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.02 * 48.sp,
  );

  static TextStyle get displayM => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 40.sp,
    height: 44 / 40,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.02 * 40.sp,
  );

  static TextStyle get headlineL => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 32.sp,
    height: 38 / 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.01 * 32.sp,
  );

  static TextStyle get headlineM => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24.sp,
    height: 30 / 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.01 * 24.sp,
  );

  static TextStyle get titleL => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20.sp,
    height: 26 / 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get titleM => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 17.sp,
    height: 24 / 17,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyL => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16.sp,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyM => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14.sp,
    height: 22 / 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get labelL => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13.sp,
    height: 18 / 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.02 * 13.sp,
  );

  static TextStyle get labelM => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 11.sp,
    height: 16 / 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.12 * 11.sp,
  );

  static TextStyle get caption => TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 10.sp,
    height: 14 / 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02 * 10.sp,
  );

  // Monospace — timers, code snippets, token / badge labels.
  static TextStyle get monoM => TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 14.sp,
    height: 22 / 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get monoLabel => TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 11.sp,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
  );
}