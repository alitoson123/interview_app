import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

/// A full-width primary continue button with a trailing arrow icon.
class ContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const ContinueButton({
    super.key,
    required this.onPressed,
    this.label = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.neutral300,
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.titleM.copyWith(color: Colors.white),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
