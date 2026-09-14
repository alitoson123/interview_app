import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/generated/l10n.dart';

class QuestionReviewExpandedContent extends StatelessWidget {
  final InterviewQuestionsModel question;
  final bool hasAnswer;

  const QuestionReviewExpandedContent({
    super.key,
    required this.question,
    required this.hasAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: AppColors.neutral200),
          SizedBox(height: 8.h),
          Text(
            s.yourAnswer,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.neutral600,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              hasAnswer ? question.userAnswer! : s.noAnswerProvided,
              style: AppTextStyles.bodyM.copyWith(
                color: hasAnswer ? AppColors.neutral900 : AppColors.neutral400,
                fontStyle: hasAnswer ? FontStyle.normal : FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            s.modelAnswer,
            style: AppTextStyles.caption.copyWith(
              color: const Color(0xFF166534),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFBBF7D0)),
            ),
            child: Text(
              question.modelAnswer,
              style: AppTextStyles.bodyM.copyWith(
                color: const Color(0xFF14532D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
