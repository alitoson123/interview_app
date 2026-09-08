import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewerAvatarCard extends StatelessWidget {
  final bool isSpeaking;
  final bool isListening;
  final VoidCallback onReplay;

  const InterviewerAvatarCard({
    super.key,
    required this.isSpeaking,
    required this.isListening,
    required this.onReplay,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildAvatar(),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      s.interviewerName,
                      style: AppTextStyles.titleM.copyWith(
                        color: AppColors.neutral900,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(Icons.verified, color: AppColors.primary, size: 16.sp),
                  ],
                ),
                SizedBox(height: 4.h),
                _buildStatusBadge(s),
              ],
            ),
          ),
          IconButton(
            onPressed: isSpeaking ? null : onReplay,
            icon: Icon(
              Icons.volume_up_rounded,
              color: isSpeaking ? AppColors.primary : AppColors.neutral600,
              size: 22.sp,
            ),
            tooltip: s.replayQuestion,
            style: IconButton.styleFrom(
              backgroundColor: isSpeaking
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : AppColors.neutral100,
              padding: EdgeInsets.all(10.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSpeaking)
          Container(
            width: 54.w,
            height: 54.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryGlow.withValues(alpha: 0.6),
                width: 3.w,
              ),
            ),
          ),
        Container(
          width: 46.w,
          height: 46.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(Icons.face_6_rounded, color: Colors.white, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(S s) {
    if (isSpeaking) {
      return _statusChip(
        label: s.speaking,
        color: AppColors.primary,
        icon: Icons.graphic_eq_rounded,
      );
    } else if (isListening) {
      return _statusChip(
        label: s.listening,
        color: AppColors.success,
        icon: Icons.mic_rounded,
      );
    }
    return _statusChip(
      label: s.interviewerRole,
      color: AppColors.neutral500,
      icon: Icons.work_outline_rounded,
    );
  }

  Widget _statusChip({
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.sp, color: color),
          SizedBox(width: 4.w),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
