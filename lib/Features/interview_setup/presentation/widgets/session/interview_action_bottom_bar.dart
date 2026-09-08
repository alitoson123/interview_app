import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewActionBottomBar extends StatelessWidget {
  final bool isAnswerSubmitted;
  final bool isLastQuestion;
  final bool isVoiceMode;
  final bool hasAnswer;
  final VoidCallback onToggleMode;
  final VoidCallback onSubmitAnswer;
  final VoidCallback onNextQuestion;

  const InterviewActionBottomBar({
    super.key,
    required this.isAnswerSubmitted,
    required this.isLastQuestion,
    required this.isVoiceMode,
    required this.hasAnswer,
    required this.onToggleMode,
    required this.onSubmitAnswer,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: AppColors.neutral200)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isAnswerSubmitted) ...[
            TextButton.icon(
              onPressed: onToggleMode,
              icon: Icon(
                isVoiceMode ? Icons.keyboard_outlined : Icons.mic_none_rounded,
                size: 18.sp,
                color: AppColors.neutral600,
              ),
              label: Text(
                isVoiceMode ? s.switchToText : s.switchToVoice,
                style: AppTextStyles.labelL.copyWith(
                  color: AppColors.neutral700,
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
          ElevatedButton(
            onPressed: isAnswerSubmitted
                ? onNextQuestion
                : (hasAnswer ? onSubmitAnswer : null),
            style: ElevatedButton.styleFrom(
              backgroundColor: isAnswerSubmitted
                  ? (isLastQuestion ? AppColors.success : AppColors.primary)
                  : AppColors.primary,
              disabledBackgroundColor: AppColors.neutral300,
              minimumSize: Size(double.infinity, 54.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.r),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isAnswerSubmitted
                      ? (isLastQuestion ? s.finishInterview : s.nextQuestion)
                      : s.submitAnswer,
                  style: AppTextStyles.titleM.copyWith(color: Colors.white),
                ),
                SizedBox(width: 8.w),
                Icon(
                  isAnswerSubmitted
                      ? (isLastQuestion
                            ? Icons.check_circle_rounded
                            : Icons.arrow_forward_rounded)
                      : Icons.send_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
