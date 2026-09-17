import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_cubit.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_state.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_review_item.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewReviewScreen extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;

  const InterviewReviewScreen({super.key, required this.interviewSetupModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GenerateInterviewCubit(interviewRepo: getIt<InterviewRepoImpl>()),
      child: _InterviewReviewContent(interviewSetupModel: interviewSetupModel),
    );
  }
}

class _InterviewReviewContent extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;

  const _InterviewReviewContent({required this.interviewSetupModel});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocConsumer<GenerateInterviewCubit, GenerateInterviewState>(
      listener: (context, state) {
        if (state is GenerateInterviewSuccess) {
          context.push(AppRoutes.interviewSessionScreen, extra: state.session);
        } else if (state is GenerateInterviewError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: AppColors.destructive,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is GenerateInterviewLoading;

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                InterviewCustomAppBar(
                  title: s.readyToStart,
                  subTitle: s.reviewSessionSubtitle,
                  currentStep: 6,
                  stepLabel: s.step6of6,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: _buildReviewCard(context, s),
                  ),
                ),
                _buildStartButton(context, s, isLoading),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildReviewCard(BuildContext context, S s) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.neutral200,
        ),
      ),
      child: Column(
        children: [
          ReviewItem(
            icon: Icons.grid_view_rounded,
            iconColor: const Color(0xff4F6CFF),
            label: s.reviewTrack,
            value: interviewSetupModel.technology == null
                ? interviewSetupModel.track
                : "${interviewSetupModel.track} (${interviewSetupModel.technology})",
          ),
          _divider(context),
          ReviewItem(
            icon: Icons.work_outline,
            iconColor: const Color(0xff8E677F),
            label: s.reviewExperience,
            value: interviewSetupModel.experience.getTitle(s),
          ),
          _divider(context),
          ReviewItem(
            icon: Icons.bolt,
            iconColor: const Color(0xffFF6B93),
            label: s.reviewDifficulty,
            value: interviewSetupModel.difficulty.getTitle(s),
          ),
          _divider(context),
          ReviewItem(
            icon: Icons.extension,
            iconColor: const Color(0xff2ED199),
            label: s.reviewType,
            value: interviewSetupModel.interviewType.getTitle(s),
          ),
          _divider(context),
          ReviewItem(
            icon: Icons.description_outlined,
            iconColor: const Color(0xff9DA3B4),
            label: s.reviewJobDescription,
            value:
                (interviewSetupModel.jobDescription != null &&
                    interviewSetupModel.jobDescription!.isNotEmpty)
                ? interviewSetupModel.jobDescription!.split('\n').first
                : s.notProvided,
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, S s, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                context.read<GenerateInterviewCubit>().generateInterview(
                  interviewSetupModel: interviewSetupModel,
                );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    s.generatingQuestions,
                    style: AppTextStyles.bodyM.copyWith(color: Colors.white),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    s.startInterview,
                    style: AppTextStyles.titleM.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
      height: 1,
      thickness: 1,
      color: isDark ? AppColors.darkBorder : AppColors.neutral100,
      indent: 20.w,
      endIndent: 20.w,
    );
  }
}
