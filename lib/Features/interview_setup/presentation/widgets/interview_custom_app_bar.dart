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
    this.trailingWidget,
  });
  final String title;
  final String subTitle;
  final int currentStep;
  final String stepLabel;

  /// Optional widget placed at the right side of the header row (e.g. Skip).
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.neutral500,
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
                      color: Colors.white,
                      border: Border.all(color: AppColors.neutral200),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColors.neutral900,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
              // Optional trailing action (e.g. Skip button)
              if (trailingWidget != null)
                Positioned(right: 16.w, child: trailingWidget!),
            ],
          ),
        ),
        OnboardingProgress(currentStep: currentStep),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.headlineM),
              Text(
                subTitle,
                style: AppTextStyles.bodyL.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
