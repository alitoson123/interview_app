import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

/// A horizontal selection card with a colored icon bubble on the left,
/// title + subtitle in the middle, and a radio-style check circle on the right.
/// Used for Experience Level, Difficulty, and Interview Type screens.
class ListSelectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const ListSelectionCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? iconColor.withOpacity(0.06) : Colors.white,
          border: Border.all(
            color: isSelected ? iconColor : AppColors.neutral200,
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            // Colored icon bubble
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.14),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            SizedBox(width: 14.w),
            // Title + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.labelL.copyWith(
                      color: AppColors.neutral900,
                      fontSize: 15.sp,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle!,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // Radio-style check indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? iconColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? iconColor : AppColors.neutral300,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 13.sp)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
