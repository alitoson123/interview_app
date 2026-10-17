import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/services/ai_consent_service/ai_consent_service.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/widgets/ai_consent_dialog.dart';
import 'package:interview_app/Core/widgets/auth_required_dialog.dart';
import 'package:interview_app/Core/widgets/interview_limit_reached_dialog.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/generate_interview_cubit/generate_interview_cubit.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewStartButton extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;
  final bool isLoading;

  const InterviewStartButton({
    super.key,
    required this.interviewSetupModel,
    required this.isLoading,
  });

  Future<void> _handleStart(BuildContext context) async {
    final auth = getIt<AuthService>();
    final isGuest = auth.user == null || !auth.isUserLoggedIn();
    if (isGuest) {
      AuthRequiredDialog.show(context);
      return;
    }

    final interviewRepo = getIt<InterviewRepoImpl>();
    final quota = await interviewRepo.getInterviewQuota();
    if (quota.isLimitReached) {
      if (!context.mounted) return;
      InterviewLimitReachedDialog.show(context);
      return;
    }

    final aiConsent = getIt<AiConsentService>();
    final hasConsent = await aiConsent.hasAcceptedConsent();
    if (!hasConsent) {
      if (!context.mounted) return;
      final accepted = await AiConsentDialog.show(context);
      if (!accepted) return;
      await aiConsent.setConsent(true);
    }

    if (!context.mounted) return;
    context.read<GenerateInterviewCubit>().generateInterview(
      interviewSetupModel: interviewSetupModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: EdgeInsets.all(24.w),
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _handleStart(context),
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
}
