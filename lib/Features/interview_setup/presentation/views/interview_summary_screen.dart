import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/interview_summary_header.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/interview_summary_stats_grid.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/question_review_expandable_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/summary/summary_action_buttons.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewSummaryScreen extends StatelessWidget {
  final InterviewSessionModel session;
  final Duration duration;

  const InterviewSummaryScreen({
    super.key,
    required this.session,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final answeredCount = session.questions
        .where((q) => q.userAnswer != null && q.userAnswer!.trim().isNotEmpty)
        .length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.go(AppRoutes.homeScreen);
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close_rounded, color: AppColors.neutral700),
            onPressed: () => context.go(AppRoutes.homeScreen),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterviewSummaryHeader(session: session),
                      SizedBox(height: 20.h),
                      InterviewSummaryStatsGrid(
                        answeredCount: answeredCount,
                        totalCount: session.questions.length,
                        duration: duration,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        s.reviewAnswers,
                        style: AppTextStyles.titleM.copyWith(
                          color: AppColors.neutral900,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: session.questions.length,
                        itemBuilder: (context, index) {
                          return QuestionReviewExpandableCard(
                            index: index,
                            question: session.questions[index],
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              SummaryActionButtons(
                onPracticeAgain: () =>
                    context.go(AppRoutes.trackSelectionScreen),
                onBackToHome: () => context.go(AppRoutes.homeScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
