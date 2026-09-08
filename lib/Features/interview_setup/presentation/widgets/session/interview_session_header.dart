import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewSessionHeader extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final String track;
  final VoidCallback onClose;

  const InterviewSessionHeader({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.track,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final progress = totalQuestions > 0 ? (currentIndex + 1) / totalQuestions : 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onClose,
                icon: Icon(Icons.close_rounded, size: 24.sp, color: AppColors.neutral700),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(8.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: const BorderSide(color: AppColors.neutral200),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.questionOf(currentIndex + 1, totalQuestions),
                      style: AppTextStyles.titleM.copyWith(color: AppColors.neutral900),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      track,
                      style: AppTextStyles.caption.copyWith(color: AppColors.neutral500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${((progress) * 100).toInt()}%',
                  style: AppTextStyles.monoLabel.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6.h,
              backgroundColor: AppColors.neutral200,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
