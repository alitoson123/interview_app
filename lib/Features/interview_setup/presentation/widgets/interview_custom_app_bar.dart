import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/onboarding_progress.dart';

class InterviewCustomAppBar extends StatelessWidget {
  const InterviewCustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.currentStep,
    required this.stepLabel,
  });
  final String title;
  final String subTitle;
  final int currentStep;
  final String stepLabel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Step label — truly centred relative to full width
              Center(
                child: Text(
                  stepLabel,
                  style: AppTextStyles.labelL.copyWith(
                    color: isDark
                        ? AppColors.darkMutedForeground
                        : AppColors.neutral500,
                  ),
                ),
              ),
              // Back button — pinned to the left edge
              Positioned(
                left: 16.w,
                child: InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(50.r),
                  child: Container(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? AppColors.darkCard : Colors.white,
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.neutral200,
                      ),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: isDark
                          ? AppColors.darkForeground
                          : AppColors.neutral900,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        OnboardingProgress(currentStep: currentStep),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.headlineM.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral900,
                ),
              ),
              Text(
                subTitle,
                style: AppTextStyles.bodyL.copyWith(
                  color: isDark
                      ? AppColors.darkMutedForeground
                      : AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
