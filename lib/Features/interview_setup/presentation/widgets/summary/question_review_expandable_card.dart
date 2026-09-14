import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/question_review_expanded_content.dart';
import 'package:interview_app/generated/l10n.dart';

class QuestionReviewExpandableCard extends StatefulWidget {
  final int index;
  final InterviewQuestionsModel question;

  const QuestionReviewExpandableCard({
    super.key,
    required this.index,
    required this.question,
  });

  @override
  State<QuestionReviewExpandableCard> createState() =>
      _QuestionReviewExpandableCardState();
}

class _QuestionReviewExpandableCardState
    extends State<QuestionReviewExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final hasAnswer = widget.question.userAnswer != null &&
        widget.question.userAnswer!.trim().isNotEmpty;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: hasAnswer ? AppColors.neutral200 : const Color(0xFFFDE68A),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(18.r),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Q${widget.index + 1}',
                      style: AppTextStyles.labelM.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.question.modelQuestion,
                          style: AppTextStyles.titleM.copyWith(
                            color: AppColors.neutral900,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        _buildStatusTag(hasAnswer, s),
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.neutral500,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            QuestionReviewExpandedContent(
              question: widget.question,
              hasAnswer: hasAnswer,
            ),
        ],
      ),
    );
  }

  Widget _buildStatusTag(bool hasAnswer, S s) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: hasAnswer
            ? AppColors.success.withValues(alpha: 0.1)
            : const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        hasAnswer ? s.questionsAnswered : s.skipped,
        style: AppTextStyles.caption.copyWith(
          color: hasAnswer ? AppColors.success : const Color(0xFFD97706),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
