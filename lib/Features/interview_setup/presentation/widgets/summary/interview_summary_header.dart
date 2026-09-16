import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewSummaryHeader extends StatelessWidget {
  final InterviewSessionModel session;

  const InterviewSummaryHeader({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      children: [
        Center(
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF22B57A), Color(0xFF10B981)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.success.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.emoji_events_rounded,
              color: Colors.white,
              size: 40.sp,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          s.interviewCompleted,
          style: AppTextStyles.headlineM.copyWith(color: AppColors.neutral900),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.h),
        Text(
          s.interviewCompletedSub,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          alignment: WrapAlignment.center,
          children: [
            _buildBadge(session.config.track, AppColors.primary),
            _buildBadge(
              session.config.difficulty.getTitle(s),
              const Color(0xffFF6B93),
            ),
            _buildBadge(
              session.config.interviewType.getTitle(s),
              const Color(0xff2ED199),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(label, style: AppTextStyles.labelM.copyWith(color: color)),
    );
  }
}
