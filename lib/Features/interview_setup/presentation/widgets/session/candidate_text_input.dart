import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
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

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_note_rounded,
                size: 18.sp,
                color: AppColors.primary,
              ),
              SizedBox(width: 6.w),
              Text(
                s.yourAnswer,
                style: AppTextStyles.labelL.copyWith(
                  color: AppColors.neutral700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          TextField(
            controller: controller,
            maxLines: 5,
            minLines: 3,
            onChanged: onChanged,
            style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral900),
            decoration: InputDecoration(
              hintText: s.typeYourAnswer,
              hintStyle: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutral400,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
