import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class PrivacyPolicyContent extends StatelessWidget {
  final bool isDark;

  const PrivacyPolicyContent({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor =
        isDark ? AppColors.darkMutedForeground : AppColors.neutral700;
    final headingColor = isDark ? AppColors.darkForeground : AppColors.neutral900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          headingColor,
          textColor,
          '1. Overview & Data Collection',
          'Intervue AI respects your privacy. We collect minimal information required to deliver mock interview simulations, track your skill progression, and manage your account.',
        ),
        SizedBox(height: 14.h),
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: _buildSection(
            AppColors.primary,
            textColor,
            '2. Third-Party AI Data Processing (Google Gemini)',
            'To generate relevant technical interview questions and provide automated evaluation, your selected track, experience level, interview format, and optional job description are securely processed using Google Gemini APIs (operated by Google LLC via Firebase Functions).\n\n• No personal identifying details (such as names, emails, or account credentials) are transmitted to the AI provider.\n• Data is used strictly for real-time interview generation and is not used to train public foundation models.',
          ),
        ),
        SizedBox(height: 14.h),
        _buildSection(
          headingColor,
          textColor,
          '3. Data Storage & Security',
          'Your interview sessions and scores are securely stored in your personal account database. You retain full control to delete individual interview records or delete your account and associated data at any time.',
        ),
        SizedBox(height: 14.h),
        _buildSection(
          headingColor,
          textColor,
          '4. User Rights & Consent',
          'Before any interview data is processed by our AI services, explicit consent is requested. You may choose not to use the AI mock interview feature without penalty.',
        ),
      ],
    );
  }

  Widget _buildSection(
    Color headingColor,
    Color bodyColor,
    String title,
    String body,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyM.copyWith(
            color: headingColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          body,
          style: AppTextStyles.caption.copyWith(color: bodyColor, height: 1.4),
        ),
      ],
    );
  }
}
