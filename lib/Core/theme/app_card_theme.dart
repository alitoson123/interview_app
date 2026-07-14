import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_radius.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Card theming. Covers three surfaces:
/// - **Surface card** — wired into `ThemeData.cardTheme` (default container).
/// - **Feature card** — [featureCardDecoration], gradient CTA, once per screen.
/// - **Glass card** — [glassCardDecoration] + [GlassCard] widget, used only
///   over active video / avatar scenes.
///
/// Spec: padding 20 (16 compact) · radius 20 · 1px border · shadow-soft at
/// rest, shadow-elevated on hover for interactive cards · 16px gap between
/// cards.
abstract class AppCardTheme {
  AppCardTheme._();

  static EdgeInsets get paddingStandard => EdgeInsets.all(20.w);
  static EdgeInsets get paddingCompact => EdgeInsets.all(16.w);
  static double get gap => 16.w;

  static CardThemeData get light => CardThemeData(
    color: AppColors.lightCard,
    elevation: 0,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.xl),
      side: const BorderSide(color: AppColors.lightBorder, width: 1),
    ),
  );

  static CardThemeData get dark => CardThemeData(
    color: AppColors.darkCard,
    elevation: 0,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.xl),
      side: const BorderSide(color: AppColors.darkBorder, width: 1),
    ),
  );

  /// Feature card — gradient fill, reserved for the single hero CTA per screen.
  static BoxDecoration get featureCardDecoration => BoxDecoration(
    gradient: const LinearGradient(
      colors: AppColors.primaryGradient,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(AppRadius.xl),
    boxShadow: AppShadows.glow,
  );

  /// Glass card fill/border. Must be paired with a `BackdropFilter`
  /// (see [GlassCard]) to get the 20px blur, 160% saturation effect.
  static BoxDecoration glassCardDecoration({bool dark = false}) => BoxDecoration(
        color: (dark ? AppColors.black : AppColors.white).withOpacity(0.55),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: (dark ? AppColors.white : AppColors.black).withOpacity(0.12),
        ),
      );
}

/// Glass card — 20px blur + saturation boost, for use over video/avatar scenes.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.dark = false,
  });

  final Widget child;
  final EdgeInsets? padding;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: BackdropFilter(
        filter: ImageFilter.compose(
          outer: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
          inner: const ColorFilter.matrix(<double>[
            1.6, 0, 0, 0, 0, //
            0, 1.6, 0, 0, 0, //
            0, 0, 1.6, 0, 0, //
            0, 0, 0, 1, 0, //
          ]),
        ),
        child: Container(
          padding: padding ?? AppCardTheme.paddingStandard,
          decoration: AppCardTheme.glassCardDecoration(dark: dark),
          child: child,
        ),
      ),
    );
  }
}