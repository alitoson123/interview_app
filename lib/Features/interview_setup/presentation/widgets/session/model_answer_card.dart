import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/utils/bidi_util.dart';
import 'package:interview_app/generated/l10n.dart';

class ModelAnswerCard extends StatelessWidget {
  final String modelAnswer;

  const ModelAnswerCard({
    super.key,
    required this.modelAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final direction = BidiUtil.getDirection(
      modelAnswer,
      defaultDirection: TextDirection.rtl,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.success.withValues(alpha: 0.12)
            : const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.success.withValues(alpha: 0.3)
              : const Color(0xFFBBF7D0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.success.withValues(alpha: 0.2)
                      : const Color(0xFFDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: isDark ? const Color(0xFF86EFAC) : AppColors.success,
                  size: 16.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  s.modelAnswer,
                  style: AppTextStyles.labelL.copyWith(
                    color: isDark
                        ? const Color(0xFF86EFAC)
                        : const Color(0xFF166534),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: Text(
              modelAnswer,
              textDirection: direction,
              textAlign: TextAlign.start,
              style: AppTextStyles.bodyM.copyWith(
                color: isDark
                    ? const Color(0xFFDCFCE7)
                    : const Color(0xFF14532D),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
