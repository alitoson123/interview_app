import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDestructive;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.trailing,
    this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.destructive.withValues(alpha: 0.1)
                    : AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColors.destructive : AppColors.primary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyM.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isDestructive
                      ? AppColors.destructive
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: AppTextStyles.labelL.copyWith(
                  color: AppColors.neutral500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 6.w),
            ],
            if (trailing != null)
              trailing!
            else
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.neutral400,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
