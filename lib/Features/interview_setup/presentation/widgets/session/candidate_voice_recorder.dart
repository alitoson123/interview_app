import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class CandidateVoiceRecorder extends StatelessWidget {
  final bool isListening;
  final String recognizedText;
  final VoidCallback onToggleListening;

  const CandidateVoiceRecorder({
    super.key,
    required this.isListening,
    required this.recognizedText,
    required this.onToggleListening,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      children: [
        _buildTranscriptionBox(s),
        SizedBox(height: 20.h),
        _buildMicButton(s),
        SizedBox(height: 10.h),
        Text(
          isListening ? s.tapToStop : s.tapToSpeak,
          style: AppTextStyles.labelL.copyWith(
            color: isListening ? AppColors.destructive : AppColors.neutral600,
          ),
        ),
      ],
    );
  }

  Widget _buildTranscriptionBox(S s) {
    final hasText = recognizedText.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 90.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isListening
            ? AppColors.primary.withValues(alpha: 0.04)
            : AppColors.neutral50,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isListening ? AppColors.primary : AppColors.neutral200,
          width: isListening ? 1.5 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isListening ? Icons.mic : Icons.mic_none,
                size: 16.sp,
                color: isListening ? AppColors.primary : AppColors.neutral400,
              ),
              SizedBox(width: 6.w),
              Text(
                s.yourAnswer,
                style: AppTextStyles.caption.copyWith(
                  color: isListening ? AppColors.primary : AppColors.neutral500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            hasText
                ? recognizedText
                : (isListening ? s.listeningHint : s.tapToSpeak),
            style: AppTextStyles.bodyM.copyWith(
              color: hasText ? AppColors.neutral900 : AppColors.neutral400,
              fontStyle: hasText ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMicButton(S s) {
    return GestureDetector(
      onTap: onToggleListening,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 72.w,
        height: 72.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: isListening
                ? [AppColors.destructive, const Color(0xFFF87171)]
                : AppColors.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: (isListening ? AppColors.destructive : AppColors.primary)
                  .withValues(alpha: 0.35),
              blurRadius: 16,
              spreadRadius: isListening ? 4 : 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          isListening ? Icons.stop_rounded : Icons.mic_rounded,
          color: Colors.white,
          size: 32.sp,
        ),
      ),
    );
  }
}
