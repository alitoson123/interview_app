import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/history/presentation/widgets/history_details_header.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/question_review_expandable_card.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewDetailsView extends StatelessWidget {
  final InterviewSessionModel session;

  const InterviewDetailsView({super.key, required this.session});

  void _onActionButtonPressed(BuildContext context) {
    if (session.status == InterviewStatus.completed) {
      final resetQuestions = session.questions
          .map((q) => q.copyWith(userAnswer: ''))
          .toList();
      final freshSession = session.copyWith(
        questions: resetQuestions,
        status: InterviewStatus.inProgress,
      );
      context.push(AppRoutes.interviewSessionScreen, extra: (freshSession, 0));
    } else {
      final firstUnanswered = session.questions.indexWhere(
        (q) => q.userAnswer == null || q.userAnswer!.trim().isEmpty,
      );
      final resumeIndex = firstUnanswered >= 0 ? firstUnanswered : 0;
      context.push(
        AppRoutes.interviewSessionScreen,
        extra: (session, resumeIndex),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isCompleted = session.status == InterviewStatus.completed;

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: AppBar(
        title: Text(s.interviewDetails, style: AppTextStyles.titleL),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          HistoryDetailsHeader(session: session),
          SizedBox(height: 20.h),
          Text(
            s.reviewAnswers,
            style: AppTextStyles.titleM.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12.h),
          ...List.generate(session.questions.length, (index) {
            return QuestionReviewExpandableCard(
              index: index,
              question: session.questions[index],
            );
          }),
          SizedBox(height: 80.h),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.neutral200)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          onPressed: () => _onActionButtonPressed(context),
          child: Text(
            isCompleted ? s.tryAgain : s.continueInterview,
            style: AppTextStyles.titleM.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
