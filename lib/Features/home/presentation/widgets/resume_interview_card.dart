import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_cubit.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_state.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/generated/l10n.dart';

class ResumeInterviewCard extends StatelessWidget {
  const ResumeInterviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentInterviewCubit, RecentInterviewState>(
      builder: (context, state) {
        if (state is RecentInterviewLoaded && state.session != null) {
          return _ResumeCardContent(session: state.session!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ResumeCardContent extends StatelessWidget {
  final InterviewSessionModel session;

  const _ResumeCardContent({required this.session});

  void _onResume(BuildContext context, int targetIndex) async {
    await context.push(
      AppRoutes.interviewSessionScreen,
      extra: (session, targetIndex),
    );
    if (context.mounted) {
      context.read<RecentInterviewCubit>().fetchRecentInProgressInterview();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final unansweredIndex = session.questions.indexWhere(
      (q) => q.userAnswer == null || q.userAnswer!.trim().isEmpty,
    );
    final targetIndex = unansweredIndex == -1 ? 0 : unansweredIndex;
    final currentQuestionNumber = (unansweredIndex == -1
            ? session.questions.length
            : unansweredIndex) +
        1;

    final trackTitle = session.config.technology != null
        ? '${session.config.track} - ${session.config.technology}'
        : '${session.config.track} - ${session.config.interviewType.getTitle(s)}';

    final subtitle =
        '${s.questionOf(currentQuestionNumber, session.questions.length)} • ${session.config.difficulty.getTitle(s)}';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: -40.w,
            bottom: -40.h,
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          PositionedDirectional(
            end: 40.w,
            top: -10.h,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white, size: 14.sp),
                  SizedBox(width: 6.w),
                  Text(
                    s.continue_where_you_left_off,
                    style: AppTextStyles.labelL.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                trackTitle,
                style: AppTextStyles.titleL.copyWith(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: AppTextStyles.bodyM.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () => _onResume(context, targetIndex),
                borderRadius: BorderRadius.circular(24.r),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        s.resume,
                        style: AppTextStyles.labelL.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
