import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewReviewScreen extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;

  const InterviewReviewScreen({super.key, required this.interviewSetupModel});

  void _onStartInterview(BuildContext context) {
    // TODO: Create the interview session and navigate to actual interview
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
                      _ReviewItem(
                        icon: Icons.grid_view_rounded,
                        iconColor: const Color(0xff4F6CFF),
                        label: s.reviewTrack,
                        value: interviewSetupModel.technology == null
                            ? interviewSetupModel.track.title
                            : "${interviewSetupModel.track.title} (${interviewSetupModel.technology!.title})",
                      ),
                      _buildDivider(),
                      _ReviewItem(
                        icon: Icons.work_outline,
                        iconColor: const Color(0xff8E677F),
                        label: s.reviewExperience,
                        value:
                            interviewSetupModel.experience.getTitle(s)
                      ),
                      _buildDivider(),
                      _ReviewItem(
                        icon: Icons.bolt,
                        iconColor: const Color(0xffFF6B93),
                        label: s.reviewDifficulty,
                        value:
                            interviewSetupModel.difficulty.getTitle(s) 
                      ),
                      _buildDivider(),
                      _ReviewItem(
                        icon: Icons.extension,
                        iconColor: const Color(0xff2ED199),
                        label: s.reviewType,
                        value:
                            interviewSetupModel.type.getTitle(s) 
                      ),
                      _buildDivider(),
                      _ReviewItem(
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

class _ReviewItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _ReviewItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.labelL.copyWith(
                    color: AppColors.neutral500,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Icon(
            Icons.check_circle_outline,
            color: const Color(0xff4F6CFF),
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
