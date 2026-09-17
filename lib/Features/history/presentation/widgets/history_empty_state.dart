import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history_toggle_off_rounded,
                size: 48.sp,
                color: isDark ? AppColors.primaryGlow : AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              s.noHistoryFound,
              style: AppTextStyles.titleM.copyWith(
                color: isDark ? AppColors.darkForeground : AppColors.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              s.noHistoryFoundSub,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyM.copyWith(
                color: isDark
                    ? AppColors.darkMutedForeground
                    : AppColors.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
