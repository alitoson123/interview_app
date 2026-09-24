import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_assets.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          _buildLogo(isDark),
          SizedBox(height: 24.h),
          _buildTitle(isDark),
          SizedBox(height: 8.h),
          _buildSubtitle(isDark),
          const Spacer(flex: 2),
          _buildProgressIndicator(isDark),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildLogo(bool isDark) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                (isDark ? AppColors.primaryGlow : AppColors.primary)
                    .withOpacity(0.18),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: AppShadows.glow,
            border: Border.all(
              color: (isDark ? AppColors.primaryGlow : AppColors.primary)
                  .withOpacity(0.25),
              width: 1.5.w,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              AppAssets.appIcon,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(bool isDark) {
    return RichText(
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
    );
  }

  Widget _buildSubtitle(bool isDark) {
    return Text(
      'AI Interview Coach',
      style: AppTextStyles.bodyM.copyWith(
        color: isDark ? AppColors.darkMutedForeground : AppColors.neutral500,
        letterSpacing: 0.3.w,
      ),
    );
  }

  Widget _buildProgressIndicator(bool isDark) {
    return SizedBox(
      width: 22.w,
      height: 22.h,
      child: CircularProgressIndicator(
        strokeWidth: 2.2.w,
        valueColor: AlwaysStoppedAnimation<Color>(
          isDark ? AppColors.primaryGlow : AppColors.primary,
        ),
      ),
    );
  }
}
