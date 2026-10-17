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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCompleted = session.status == InterviewStatus.completed;
    final dateStr = DateFormat.yMMMd().add_jm().format(session.createdAt);

    return Container(
      padding: EdgeInsets.all(16.w),
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
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  session.config.technology != null
                      ? '${session.config.track} • ${session.config.technology}'
                      : session.config.track,
                  style: AppTextStyles.titleL.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: isDark
                        ? AppColors.darkForeground
                        : AppColors.neutral900,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.success.withValues(alpha: 0.1)
                      : (isDark
                          ? const Color(0xFF78350F).withValues(alpha: 0.4)
                          : const Color(0xFFFEF3C7)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  isCompleted ? s.filterCompleted : s.filterInProgress,
                  style: AppTextStyles.caption.copyWith(
                    color: isCompleted
                        ? AppColors.success
                        : (isDark
                            ? const Color(0xFFFDE68A)
                            : const Color(0xFFD97706)),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            dateStr,
            style: AppTextStyles.caption.copyWith(
              color: isDark
                  ? AppColors.darkMutedForeground
                  : AppColors.neutral500,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildBadge(
                session.config.experience.name.toUpperCase(),
                isDark,
              ),
              _buildBadge(
                session.config.difficulty.name.toUpperCase(),
                isDark,
              ),
              _buildBadge(
                session.config.interviewType.name.toUpperCase(),
                isDark,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.neutral100,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: isDark ? AppColors.darkMutedForeground : AppColors.neutral700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
