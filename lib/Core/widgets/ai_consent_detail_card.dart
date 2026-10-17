import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class AiConsentDetailCard extends StatelessWidget {
  final bool isDark;

  const AiConsentDetailCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.neutral50,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem(Icons.verified_user_outlined, s.aiThirdPartyProvider),
          SizedBox(height: 6.h),
          _buildItem(Icons.lock_outline, s.aiNoPiiShared),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: AppColors.primary),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: isDark ? AppColors.darkMutedForeground : AppColors.neutral700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
