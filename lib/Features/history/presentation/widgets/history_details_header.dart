import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryDetailsHeader extends StatelessWidget {
  final InterviewSessionModel session;

  const HistoryDetailsHeader({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isCompleted = session.status == InterviewStatus.completed;
    final dateStr = DateFormat.yMMMd().add_jm().format(session.createdAt);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                session.config.technology != null
                    ? '${session.config.track} • ${session.config.technology}'
                    : session.config.track,
                style: AppTextStyles.titleL.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.success.withValues(alpha: 0.1)
                      : const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  isCompleted ? s.filterCompleted : s.filterInProgress,
                  style: AppTextStyles.caption.copyWith(
                    color: isCompleted
                        ? AppColors.success
                        : const Color(0xFFD97706),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            dateStr,
            style: AppTextStyles.caption.copyWith(color: AppColors.neutral500),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildBadge(session.config.experience.name.toUpperCase()),
              _buildBadge(session.config.difficulty.name.toUpperCase()),
              _buildBadge(session.config.interviewType.name.toUpperCase()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.neutral700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
