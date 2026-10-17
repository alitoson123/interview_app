import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_review_item.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewReviewCard extends StatelessWidget {
  final InterviewSetupModel interviewSetupModel;

  const InterviewReviewCard({
    super.key,
    required this.interviewSetupModel,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
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
          _buildDivider(context),
          ReviewItem(
            icon: Icons.work_outline,
            iconColor: const Color(0xff8E677F),
            label: s.reviewExperience,
            value: interviewSetupModel.experience.getTitle(s),
          ),
          _buildDivider(context),
          ReviewItem(
            icon: Icons.bolt,
            iconColor: const Color(0xffFF6B93),
            label: s.reviewDifficulty,
            value: interviewSetupModel.difficulty.getTitle(s),
          ),
          _buildDivider(context),
          ReviewItem(
            icon: Icons.extension,
            iconColor: const Color(0xff2ED199),
            label: s.reviewType,
            value: interviewSetupModel.interviewType.getTitle(s),
          ),
          _buildDivider(context),
          ReviewItem(
            icon: Icons.description_outlined,
            iconColor: const Color(0xff9DA3B4),
            label: s.reviewJobDescription,
            value: (interviewSetupModel.jobDescription != null &&
                    interviewSetupModel.jobDescription!.isNotEmpty)
                ? interviewSetupModel.jobDescription!.split('\n').first
                : s.notProvided,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
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
