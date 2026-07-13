import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'app_radius.dart';

/// Input field theme.
///
/// Spec: height 48 (achieved via `contentPadding`), radius 14, 1px border at
/// rest, primary border + ring on focus, destructive border on error.
abstract class AppInputDecoration {
  AppInputDecoration._();

  static InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.muted,
    isDense: false,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    hintStyle:
        AppTextStyles.bodyM.copyWith(color: AppColors.lightMutedForeground),
    labelStyle:
        AppTextStyles.labelM.copyWith(color: AppColors.lightMutedForeground),
    errorStyle: AppTextStyles.caption.copyWith(
      color: AppColors.destructive,
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.lightBorder, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.lightBorder, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.destructive, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.destructive, width: 1.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(
        color: AppColors.lightBorder.withOpacity(0.6),
        width: 1,
      ),
    ),
  );

  static InputDecorationTheme dark = light.copyWith(
    fillColor: AppColors.darkInput,
    hintStyle:
        AppTextStyles.bodyM.copyWith(color: AppColors.darkMutedForeground),
    labelStyle:
        AppTextStyles.labelM.copyWith(color: AppColors.darkMutedForeground),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.primaryGlow, width: 1.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(
        color: AppColors.darkBorder.withOpacity(0.6),
        width: 1,
      ),
    ),
  );
}