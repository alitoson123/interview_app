import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/widgets/interview_limit_reached_dialog.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_cubit.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_state.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_quota_badge.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_review_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_start_button.dart';
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
        } else if (state is GenerateInterviewLimitReached) {
          InterviewLimitReachedDialog.show(context);
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
                    child: InterviewReviewCard(
                      interviewSetupModel: interviewSetupModel,
                    ),
                  ),
                ),
                const InterviewQuotaBadge(),
                InterviewStartButton(
                  interviewSetupModel: interviewSetupModel,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
