import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  final String subtitle;

  const AuthHeader({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          width: 64.w,
          height: 64.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: const LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: AppShadows.glow,
          ),
          child: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 40.sp,
          ),
        ),
        SizedBox(height: 24.h),
        RichText(
          text: TextSpan(
            style: AppTextStyles.headlineL.copyWith(color: AppColors.neutral900),
            children: const [
              TextSpan(text: 'Ace'),
              TextSpan(
                text: 'Interview',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
