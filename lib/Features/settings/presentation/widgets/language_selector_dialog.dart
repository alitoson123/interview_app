import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class LanguageSelectorDialog extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onSelected;

  const LanguageSelectorDialog({
    super.key,
    required this.currentLocale,
    required this.onSelected,
  });

  static void show(
    BuildContext context, {
    required Locale currentLocale,
    required ValueChanged<Locale> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => LanguageSelectorDialog(
        currentLocale: currentLocale,
        onSelected: onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final options = [
      (s.english, const Locale('en'), '🇺🇸'),
      (s.arabic, const Locale('ar'), '🇸🇦'),
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
            s.chooseLanguage,
            style: AppTextStyles.titleL.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          ...options.map((option) {
            final isSelected = currentLocale.languageCode == option.$2.languageCode;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(option.$3, style: TextStyle(fontSize: 22.sp)),
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
                onSelected(option.$2);
              },
            );
          }),
        ],
      ),
    );
  }
}
