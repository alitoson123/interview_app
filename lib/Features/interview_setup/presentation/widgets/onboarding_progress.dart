import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class OnboardingProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index < currentStep;
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              height: 4.h,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.neutral200,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          );
        }),
      ),
    );
  }
}
