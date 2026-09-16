import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryItemCard extends StatelessWidget {
  final InterviewSessionModel session;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const HistoryItemCard({
    super.key,
    required this.session,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isCompleted = session.status == InterviewStatus.completed;
    final answeredCount = session.questions
        .where((q) => q.userAnswer != null && q.userAnswer!.trim().isNotEmpty)
        .length;
    final dateStr = DateFormat.yMMMd().add_jm().format(session.createdAt);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        session.config.technology != null
                            ? '${session.config.track} • ${session.config.technology}'
                            : session.config.track,
                        style: AppTextStyles.titleM.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    _buildStatusBadge(isCompleted, s),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  dateStr,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isCompleted
                          ? s.questionsCountCompleted(session.questions.length)
                          : s.questionsCount(
                              answeredCount,
                              session.questions.length,
                            ),
                      style: AppTextStyles.bodyM.copyWith(
                        color: isCompleted
                            ? AppColors.success
                            : const Color(0xFFD97706),
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline_rounded, size: 20),
                      color: AppColors.neutral400,
                      onPressed: onDelete,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(bool isCompleted, S s) {
    return Container(
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
          color: isCompleted ? AppColors.success : const Color(0xFFD97706),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
