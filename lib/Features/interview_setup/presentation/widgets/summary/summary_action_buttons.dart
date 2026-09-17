import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class SummaryActionButtons extends StatelessWidget {
  final VoidCallback onPracticeAgain;
  final VoidCallback onBackToHome;

  const SummaryActionButtons({
    super.key,
    required this.onPracticeAgain,
    required this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.neutral200,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: onPracticeAgain,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? AppColors.primaryGlow : AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 52.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.r),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay_rounded, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  s.practiceAgain,
                  style: AppTextStyles.titleM.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          OutlinedButton(
            onPressed: onBackToHome,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.neutral300,
              ),
              minimumSize: Size(double.infinity, 52.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: isDark ? AppColors.darkForeground : AppColors.neutral700,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  s.backToHome,
                  style: AppTextStyles.titleM.copyWith(
                    color: isDark
                        ? AppColors.darkForeground
                        : AppColors.neutral800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
