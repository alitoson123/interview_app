import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_quota_badge.dart';
import 'package:interview_app/generated/l10n.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final authService = getIt<AuthService>();
    final isGuest = authService.user == null || !authService.isUserLoggedIn();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder<UserModel?>(
      future: isGuest
          ? Future.value(null)
          : getIt<AuthLocalDataSource>().getUser(),
      builder: (context, snapshot) {
        final localUser = snapshot.data;
        final rawName = localUser?.name.isNotEmpty == true
            ? localUser!.name
            : authService.user?.displayName;
        final userName = (isGuest || rawName == null || rawName.trim().isEmpty)
            ? s.guestUser
            : rawName;
        final initials = userName.isNotEmpty
            ? userName
                  .trim()
                  .split(' ')
                  .map((e) => e.isNotEmpty ? e[0] : '')
                  .take(2)
                  .join()
                  .toUpperCase()
            : 'G';

        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      initials,
                      style: AppTextStyles.titleM
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          s.good_morning,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.labelL.copyWith(
                            color: isDark
                                ? AppColors.darkMutedForeground
                                : AppColors.neutral500,
                          ),
                        ),
                        Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleM.copyWith(
                            color: isDark
                                ? AppColors.darkForeground
                                : AppColors.neutral900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            if (isGuest)
              OutlinedButton.icon(
                onPressed: () =>
                    GoRouter.of(context).push(AppRoutes.signInScreen),
                icon: Icon(Icons.login_rounded, size: 16.sp),
                label: Text(s.logIn, style: AppTextStyles.labelM),
                style: OutlinedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  side: BorderSide(
                    color:
                        isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              )
            else
              const InterviewQuotaBadge(),
          ],
        );
      },
    );
  }
}
