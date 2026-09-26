import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/utils/bidi_util.dart';
import 'package:interview_app/generated/l10n.dart';

class CandidateTextInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CandidateTextInput({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_note_rounded,
                size: 18.sp,
                color: isDark ? AppColors.primaryGlow : AppColors.primary,
              ),
              SizedBox(width: 6.w),
              Text(
                s.yourAnswer,
                style: AppTextStyles.labelL.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, _) {
              return TextField(
                controller: controller,
                maxLines: 5,
                minLines: 3,
                textDirection: BidiUtil.getDirection(
                  value.text,
                  defaultDirection: TextDirection.rtl,
                ),
                textAlign: TextAlign.start,
                onChanged: onChanged,
                style: AppTextStyles.bodyM.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral900,
                ),
                decoration: InputDecoration(
                  hintText: s.typeYourAnswer,
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: AppTextStyles.bodyM.copyWith(
                    color: isDark
                        ? AppColors.darkMutedForeground
                        : AppColors.neutral400,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
