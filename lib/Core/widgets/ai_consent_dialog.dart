import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/widgets/ai_consent_detail_card.dart';
import 'package:interview_app/Core/widgets/privacy_policy_sheet.dart';
import 'package:interview_app/generated/l10n.dart';

class AiConsentDialog extends StatelessWidget {
  const AiConsentDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AiConsentDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(isDark, s),
            SizedBox(height: 16.h),
            Text(
              s.aiConsentMessage,
              style: AppTextStyles.bodyM.copyWith(
                color: isDark ? AppColors.darkMutedForeground : AppColors.neutral600,
                height: 1.45,
              ),
            ),
            SizedBox(height: 14.h),
            AiConsentDetailCard(isDark: isDark),
            SizedBox(height: 12.h),
            _buildPrivacyLink(context, s),
            SizedBox(height: 20.h),
            _buildActionButtons(context, s),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark, S s) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(Icons.auto_awesome, color: AppColors.primary, size: 22.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            s.aiConsentTitle,
            style: AppTextStyles.titleM.copyWith(
              color: isDark ? AppColors.darkForeground : AppColors.neutral900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacyLink(BuildContext context, S s) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: InkWell(
        onTap: () => PrivacyPolicySheet.show(context),
        borderRadius: BorderRadius.circular(6.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shield_outlined, size: 14.sp, color: AppColors.primary),
              SizedBox(width: 6.w),
              Text(
                s.readPrivacyPolicy,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, S s) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            elevation: 0,
          ),
          child: Text(
            s.aiConsentAgree,
            style: AppTextStyles.bodyM.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, 40.h),
          ),
          child: Text(
            s.aiConsentDecline,
            style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral500),
          ),
        ),
      ],
    );
  }
}
