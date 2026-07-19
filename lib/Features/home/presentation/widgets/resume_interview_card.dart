import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class ResumeInterviewCard extends StatelessWidget {
  const ResumeInterviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      width: double.infinity,
      
      padding: EdgeInsets.only(left: 15.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          // Background decorative circles
          Positioned(
            right: -40.w,
            bottom: -40.h,
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            right: 40.w,
            top: -10.h,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:15.w),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 14.sp),
                    SizedBox(width: 6.w),
                    Text(
                      s.continue_where_you_left_off,
                      style: AppTextStyles.labelL.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                s.react_technical,
                style: AppTextStyles.titleL.copyWith(color: Colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                s.question_8_of_12_mid_level,
                style: AppTextStyles.bodyM.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 16.h),
              // Progress bar
             /* Container(
                width: double.infinity,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),*/
              // Resume Button
              Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        s.resume,
                        style: AppTextStyles.labelL.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
