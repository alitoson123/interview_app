import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class GuestContinueButton extends StatelessWidget {
  const GuestContinueButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton(
      onPressed:
          onPressed ?? () => GoRouter.of(context).go(AppRoutes.homeScreen),
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(56.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        side: BorderSide(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        foregroundColor:
            isDark ? AppColors.darkForeground : AppColors.neutral900,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline_rounded,
            size: 22.sp,
            color: isDark ? AppColors.darkForeground : AppColors.neutral700,
          ),
          SizedBox(width: 12.w),
          Text(
            s.continue_as_guest,
            style: AppTextStyles.titleM.copyWith(
              color: isDark ? AppColors.darkForeground : AppColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}
