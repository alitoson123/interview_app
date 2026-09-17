import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class SettingsSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Text(
            title,
            style: AppTextStyles.labelM.copyWith(
              color: AppColors.neutral500,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: Column(
            children: List.generate(children.length, (index) {
              final isLast = index == children.length - 1;
              return Column(
                children: [
                  children[index],
                  if (!isLast)
                    Divider(
                      height: 1,
                      thickness: 1,
                      indent: 54.w,
                      endIndent: 16.w,
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
