import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/theme/app_color.dart';

/// Elevation system — four levels of depth. Regular shadows use neutral-900
/// at low opacity; [glow] uses the brand primary for emphasis (FAB, logo,
/// primary CTAs).
abstract class AppShadows {
  AppShadows._();

  /// Hairline separation, resting chips.
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.06),
      offset: Offset(0.w, 1.h),
      blurRadius: 2.r,
    ),
  ];

  /// Default cards, list items.
  static List<BoxShadow> get soft => [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.08),
      offset: Offset(0.w, 4.h),
      blurRadius: 16.r,
      spreadRadius: -4.r,
    ),
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.06),
      offset: Offset(0.w, 2.h),
      blurRadius: 6.r,
      spreadRadius: -2.r,
    ),
  ];

  /// Modals, phone frame, popovers.
  static List<BoxShadow> get elevated => [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.12),
      offset: Offset(0.w, 20.h),
      blurRadius: 40.r,
      spreadRadius: -12.r,
    ),
  ];

  /// FAB, logo, primary CTAs.
  static List<BoxShadow> get glow => [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.35),
      offset: Offset(0.w, 10.h),
      blurRadius: 30.r,
      spreadRadius: -8.r,
    ),
  ];
}