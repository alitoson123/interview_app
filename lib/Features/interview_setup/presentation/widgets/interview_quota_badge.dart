import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/domain/entities/interview_quota.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewQuotaBadge extends StatefulWidget {
  const InterviewQuotaBadge({super.key});

  @override
  State<InterviewQuotaBadge> createState() => _InterviewQuotaBadgeState();
}

class _InterviewQuotaBadgeState extends State<InterviewQuotaBadge> {
  @override
  void initState() {
    super.initState();
    getIt<InterviewRepoImpl>().getInterviewQuota();
  }

  @override
  Widget build(BuildContext context) {
    final auth = getIt<AuthService>();
    final isGuest = auth.user == null || !auth.isUserLoggedIn();
    if (isGuest) return const SizedBox.shrink();

    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StreamBuilder<InterviewQuota>(
      stream: getIt<InterviewRepoImpl>().watchInterviewQuota(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final quota = snapshot.data!;
        final isExhausted = quota.isLimitReached;

        final badgeColor =
            isExhausted ? AppColors.destructive : AppColors.primary;
        final labelText = isExhausted
            ? s.interviewsExhausted
            : s.interviewsRemainingBadge(quota.remaining, quota.limit);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: badgeColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: badgeColor.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isExhausted ? Icons.lock_clock_rounded : Icons.bolt_rounded,
                size: 14.sp,
                color: badgeColor,
              ),
              SizedBox(width: 6.w),
              Text(
                labelText,
                style: AppTextStyles.labelM.copyWith(
                  color: isDark ? AppColors.darkForeground : badgeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
