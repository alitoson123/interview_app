import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_assets.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class AuthHeader extends StatelessWidget {
  final String subtitle;

  const AuthHeader({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          width: 64.w,
          height: 64.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: AppShadows.glow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppAssets.appIcon,
              width: 64.w,
              height: 64.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        RichText(
          text: TextSpan(
            style: AppTextStyles.headlineL.copyWith(
              color: isDark ? AppColors.darkForeground : AppColors.neutral900,
            ),
            children: [
              const TextSpan(text: 'Intervue'),
              TextSpan(
                text: ' AI',
                style: TextStyle(
                  color: isDark ? AppColors.primaryGlow : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyles.bodyM.copyWith(
            color: isDark ? AppColors.darkMutedForeground : AppColors.neutral500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
