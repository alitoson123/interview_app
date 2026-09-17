import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewSummaryStatsGrid extends StatelessWidget {
  final int answeredCount;
  final int totalCount;
  final Duration duration;

  const InterviewSummaryStatsGrid({
    super.key,
    required this.answeredCount,
    required this.totalCount,
    required this.duration,
  });

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (d.inHours > 0) {
      return '${d.inHours}h ${minutes}m';
    }
    return '${minutes}m ${seconds}s';
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final percentage = totalCount > 0 ? ((answeredCount / totalCount) * 100).toInt() : 0;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppColors.primary,
            title: s.questionsAnswered,
            value: '$answeredCount/$totalCount',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.timer_outlined,
            iconColor: const Color(0xFFF59E0B),
            title: s.timeSpent,
            value: _formatDuration(duration),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.analytics_outlined,
            iconColor: AppColors.success,
            title: s.completionRate,
            value: '$percentage%',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.neutral200,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 22.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: AppTextStyles.titleM.copyWith(
              color: isDark ? AppColors.darkForeground : AppColors.neutral900,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              color: isDark
                  ? AppColors.darkMutedForeground
                  : AppColors.neutral500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
