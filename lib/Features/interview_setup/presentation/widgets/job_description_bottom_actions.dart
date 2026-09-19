import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionBottomActions extends StatelessWidget {
  final bool hasContent;
  final VoidCallback onSkip;
  final VoidCallback onContinue;

  const JobDescriptionBottomActions({
    super.key,
    required this.hasContent,
    required this.onSkip,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onSkip,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.neutral300,
                ),
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              child: Text(
                s.skip,
                style: AppTextStyles.titleM.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral600,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: hasContent ? onContinue : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? AppColors.primaryGlow
                    : AppColors.primary,
                disabledBackgroundColor: isDark
                    ? AppColors.neutral700
                    : AppColors.neutral300,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    s.continuee,
                    style: AppTextStyles.titleM.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
