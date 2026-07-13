import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';


/// Button size spec: height 32/44/56, horizontal padding 12/20/28,
/// radius 10/14/20.
enum AppButtonSize { small, medium, large }

extension AppButtonSizeSpec on AppButtonSize {
  double get height => switch (this) {
        AppButtonSize.small => 32,
        AppButtonSize.medium => 44,
        AppButtonSize.large => 56,
      };

  double get horizontalPadding => switch (this) {
        AppButtonSize.small => 12,
        AppButtonSize.medium => 20,
        AppButtonSize.large => 28,
      };

  double get radius => switch (this) {
        AppButtonSize.small => 10,
        AppButtonSize.medium => 14,
        AppButtonSize.large => 20,
      };

  TextStyle get textStyle => switch (this) {
        AppButtonSize.small => AppTextStyles.labelL.copyWith(fontSize: 13),
        AppButtonSize.medium => AppTextStyles.labelL,
        AppButtonSize.large => AppTextStyles.titleM,
      };
}

/// Button theming.
///
/// `ThemeData` can only describe *flat-color* buttons, so the true
/// "Primary" variant (gradient fill + glow shadow) is not registered on
/// `ElevatedButtonThemeData` — use [AppGradientButton] for that CTA instead.
/// Everything else (Secondary / Outline / Ghost / Destructive) is wired
/// into `AppTheme` via the `ThemeData` fields below.
abstract class AppButtonTheme {
  AppButtonTheme._();

  static const double _gap = 8; // icon–label gap
 // static const Size _minTapTarget = Size(48, 48);

  static ButtonStyle _base(AppButtonSize size) => ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(0, size.height)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: size.horizontalPadding),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.radius),
          ),
        ),
        textStyle: WidgetStatePropertyAll(size.textStyle),
        animationDuration: const Duration(milliseconds: 150),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  /// Secondary — filled with `--secondary`, foreground text.
  static ElevatedButtonThemeData secondary({
    AppButtonSize size = AppButtonSize.medium,
    bool dark = false,
  }) =>
      ElevatedButtonThemeData(
        style: _base(size).copyWith(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
          foregroundColor: WidgetStatePropertyAll(
            dark ? AppColors.darkForeground : AppColors.lightForeground,
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.pressed)
                ? AppColors.neutral900.withOpacity(0.08)
                : states.contains(WidgetState.hovered)
                    ? AppColors.neutral900.withOpacity(0.04)
                    : null,
          ),
     
        ),
      );

  /// Outline — 1px border, transparent fill.
  static OutlinedButtonThemeData outline({
    AppButtonSize size = AppButtonSize.medium,
    bool dark = false,
  }) =>
      OutlinedButtonThemeData(
        style: _base(size).copyWith(
          foregroundColor: WidgetStatePropertyAll(
            dark ? AppColors.darkForeground : AppColors.lightForeground,
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: dark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            dark ? AppColors.darkCard : AppColors.lightCard,
          ),
        ),
      );

  /// Ghost — text-only, no border, subtle hover fill.
  static TextButtonThemeData ghost({
    AppButtonSize size = AppButtonSize.medium,
    bool dark = false,
  }) =>
      TextButtonThemeData(
        style: _base(size).copyWith(
          foregroundColor: WidgetStatePropertyAll(
            (dark ? AppColors.darkForeground : AppColors.lightForeground)
                .withOpacity(0.8),
          ),
          overlayColor: WidgetStatePropertyAll(
            (dark ? AppColors.white : AppColors.neutral900).withOpacity(0.06),
          ),
        ),
      );

  /// Destructive — solid `--destructive` fill. Apply per-call-site with
  /// `ElevatedButton(style: AppButtonTheme.destructiveStyle())`.
  static ButtonStyle destructiveStyle({
    AppButtonSize size = AppButtonSize.medium,
  }) =>
      _base(size).copyWith(
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: const WidgetStatePropertyAll(AppColors.destructive),
        foregroundColor: const WidgetStatePropertyAll(AppColors.white),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.pressed)
              ? Colors.black.withOpacity(0.12)
              : states.contains(WidgetState.hovered)
                  ? Colors.black.withOpacity(0.06)
                  : null,
        ),
      );
}

/// The "Primary" CTA — gradient fill + glow shadow. Used once per screen.
class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(size.radius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(size.radius),
          child: Ink(
            height: size.height,
            padding:
                EdgeInsets.symmetric(horizontal: size.horizontalPadding),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(size.radius),
              boxShadow: disabled ? null : AppShadows.glow,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  IconTheme(
                    data: const IconThemeData(color: AppColors.white, size: 20),
                    child: icon!,
                  ),
                  const SizedBox(width: AppButtonTheme._gap),
                ],
                Text(
                  label,
                  style: size.textStyle.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// FAB — 56×56 pill, gradient primary fill, glow shadow, 4px background ring.
class AppGradientFab extends StatelessWidget {
  const AppGradientFab({
    super.key,
    required this.icon,
    required this.onPressed,
    this.ringColor,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final Color? ringColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ringColor ?? AppColors.lightBackground,
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Ink(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: AppShadows.glow,
            ),
            child: IconTheme(
              data: const IconThemeData(color: AppColors.white, size: 22),
              child: Center(child: icon),
            ),
          ),
        ),
      ),
    );
  }
}