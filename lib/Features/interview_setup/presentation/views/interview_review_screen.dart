import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_review_item.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:interview_app/test.dart';

class InterviewReviewScreen extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;

  const InterviewReviewScreen({super.key, required this.interviewSetupModel});

  void _onStartInterview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestGenerateInterviewScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.neutral200),
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
                      _buildDivider(),
                      ReviewItem(
                        icon: Icons.work_outline,
                        iconColor: const Color(0xff8E677F),
                        label: s.reviewExperience,
                        value: interviewSetupModel.experience.getTitle(s),
                      ),
                      _buildDivider(),
                      ReviewItem(
                        icon: Icons.bolt,
                        iconColor: const Color(0xffFF6B93),
                        label: s.reviewDifficulty,
                        value: interviewSetupModel.difficulty.getTitle(s),
                      ),
                      _buildDivider(),
                      ReviewItem(
                        icon: Icons.extension,
                        iconColor: const Color(0xff2ED199),
                        label: s.reviewType,
                        value: interviewSetupModel.interviewType.getTitle(s),
                      ),
                      _buildDivider(),
                      ReviewItem(
                        icon: Icons.description_outlined,
                        iconColor: const Color(0xff9DA3B4),
                        label: s.reviewJobDescription,
                        value:
                            (interviewSetupModel.jobDescription != null &&
                                interviewSetupModel.jobDescription!.isNotEmpty)
                            ? interviewSetupModel.jobDescription!
                                  .split('\n')
                                  .first
                            : s.notProvided,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: ElevatedButton(
                onPressed: () => _onStartInterview(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      s.startInterview,
                      style: AppTextStyles.titleM.copyWith(color: Colors.white),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.play_arrow, color: Colors.white, size: 20.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.neutral100,
      indent: 20.w,
      endIndent: 20.w,
    );
  }
}
