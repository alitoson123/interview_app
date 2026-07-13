import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_button_theme.dart';
import 'package:interview_app/Core/constant/app_input_decoration.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_card_theme.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/theme/app_theme_extention.dart';

/// Assembles the AceInterview Material 3 `ThemeData` from the design
/// tokens in this folder. Wire into `MaterialApp`:
///
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
///   ...
/// )
/// ```
abstract class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(brightness: Brightness.light);
  static ThemeData get dark => _build(brightness: Brightness.dark);

  static ThemeData _build({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;

    final textTheme = _textTheme(
      isDark ? AppColors.darkForeground : AppColors.lightForeground,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      canvasColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      fontFamily: AppFonts.primary,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      splashFactory: InkRipple.splashFactory,
      visualDensity: VisualDensity.standard,

      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        foregroundColor: isDark ? AppColors.darkForeground : AppColors.lightForeground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleL.copyWith(
          color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
        ),
        surfaceTintColor: Colors.transparent,
      ),

      cardTheme: isDark ? AppCardTheme.dark : AppCardTheme.light,

      inputDecorationTheme:
          isDark ? AppInputDecoration.dark : AppInputDecoration.light,

      elevatedButtonTheme: AppButtonTheme.secondary(dark: isDark),
      outlinedButtonTheme: AppButtonTheme.outline(dark: isDark),
      textButtonTheme: AppButtonTheme.ghost(dark: isDark),

      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        thickness: 1,
        space: 1,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
        selectedItemColor: AppColors.primary,
        unselectedItemColor:
            isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
        selectedLabelStyle: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w700),
        unselectedLabelStyle: AppTextStyles.caption,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? AppColors.neutral700 : AppColors.neutral800,
        contentTextStyle: AppTextStyles.bodyM.copyWith(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.secondary,
        selectedColor: AppColors.accent,
        labelStyle: AppTextStyles.labelL.copyWith(
          color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        titleTextStyle: AppTextStyles.headlineM.copyWith(
          color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
        ),
        contentTextStyle: AppTextStyles.bodyM.copyWith(
          color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
        ),
      ),

      extensions: <ThemeExtension<dynamic>>[
        isDark ? AppThemeExtension.dark : AppThemeExtension.light,
      ],
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.lightPrimaryForeground,
    secondary: AppColors.secondary,
    onSecondary: AppColors.lightForeground,
    error: AppColors.destructive,
    onError: AppColors.white,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightForeground,
    surfaceContainerHighest: AppColors.lightSurfaceElevated,
    outline: AppColors.lightBorder,
    outlineVariant: AppColors.lightBorder,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryGlow,
    onPrimary: AppColors.darkPrimaryForeground,
    secondary: AppColors.neutral700,
    onSecondary: AppColors.darkForeground,
    error: AppColors.destructive,
    onError: AppColors.white,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkForeground,
    surfaceContainerHighest: AppColors.darkSurfaceElevated,
    outline: AppColors.darkBorder,
    outlineVariant: AppColors.darkBorder,
  );

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: AppTextStyles.displayL.copyWith(color: color),
      displayMedium: AppTextStyles.displayM.copyWith(color: color),
      headlineLarge: AppTextStyles.headlineL.copyWith(color: color),
      headlineMedium: AppTextStyles.headlineM.copyWith(color: color),
      titleLarge: AppTextStyles.titleL.copyWith(color: color),
      titleMedium: AppTextStyles.titleM.copyWith(color: color),
      bodyLarge: AppTextStyles.bodyL.copyWith(color: color),
      bodyMedium: AppTextStyles.bodyM.copyWith(color: color),
      labelLarge: AppTextStyles.labelL.copyWith(color: color),
      labelMedium: AppTextStyles.labelM.copyWith(color: color),
      bodySmall: AppTextStyles.caption.copyWith(color: color),
    );
  }
}