import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class ProfileActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final bool isDestructive;
  final bool isDark;
  final VoidCallback onTap;

  const ProfileActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.isDark,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDestructive
        ? AppColors.destructive.withValues(alpha: isDark ? 0.15 : 0.05)
        : (isDark ? AppColors.darkCard : AppColors.white);

    final borderColor = isDestructive
        ? AppColors.destructive.withValues(alpha: 0.25)
        : (isDark ? AppColors.darkBorder : AppColors.lightBorder);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyM.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDestructive
                      ? AppColors.destructive
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: isDestructive ? AppColors.destructive : AppColors.neutral400,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
