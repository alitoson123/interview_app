import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class ThemeSelectorDialog extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onSelected;

  const ThemeSelectorDialog({
    super.key,
    required this.currentThemeMode,
    required this.onSelected,
  });

  static void show(
    BuildContext context, {
    required ThemeMode currentThemeMode,
    required ValueChanged<ThemeMode> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => ThemeSelectorDialog(
        currentThemeMode: currentThemeMode,
        onSelected: onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final options = [
      (s.themeSystem, Icons.brightness_auto_outlined, ThemeMode.system),
      (s.themeLight, Icons.light_mode_outlined, ThemeMode.light),
      (s.themeDark, Icons.dark_mode_outlined, ThemeMode.dark),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.chooseTheme,
            style: AppTextStyles.titleL.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          ...options.map((option) {
            final isSelected = currentThemeMode == option.$3;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                option.$2,
                color: isSelected ? AppColors.primary : AppColors.neutral500,
              ),
              title: Text(
                option.$1,
                style: AppTextStyles.bodyM.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : null,
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.check_circle, color: AppColors.primary)
                  : null,
              onTap: () {
                Navigator.of(context).pop();
                onSelected(option.$3);
              },
            );
          }),
        ],
      ),
    );
  }
}
