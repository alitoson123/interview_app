import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      builder: (context) => LogoutDialog(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkCard : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      title: Row(
        children: [
          Icon(Icons.logout, color: AppColors.destructive, size: 24.sp),
          SizedBox(width: 8.w),
          Text(
            s.logOut,
            style: AppTextStyles.titleL.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        s.logOutConfirm,
        style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral500),
      ),
      actionsPadding: EdgeInsets.only(right: 16.w, bottom: 16.h, left: 16.w),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            s.cancel,
            style: AppTextStyles.labelL.copyWith(color: AppColors.neutral500),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.destructive,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            s.logOut,
            style: AppTextStyles.labelL.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
