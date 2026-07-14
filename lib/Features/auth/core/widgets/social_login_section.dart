import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_assets.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.neutral200)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                s.or_continue_with,
                style: AppTextStyles.labelL.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.neutral200)),
          ],
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.only(bottom: 100.h),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size.fromHeight(56.h),
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
              side: const BorderSide(color: AppColors.lightBorder),
              foregroundColor: AppColors.neutral900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.googleIcon, width: 24.w, height: 24.h),
                SizedBox(width: 12.w),
                Text(
                  s.continue_with_google,
                  style: AppTextStyles.titleM.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
