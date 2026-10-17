import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authService = getIt<AuthService>();
    final isGuest = authService.user == null || !authService.isUserLoggedIn();

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isGuest ? Icons.lock_outline_rounded : Icons.history_toggle_off_rounded,
                size: 48.sp,
                color: isDark ? AppColors.primaryGlow : AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              isGuest ? s.accountRequiredTitle : s.noHistoryFound,
              style: AppTextStyles.titleM.copyWith(
                color: isDark ? AppColors.darkForeground : AppColors.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              isGuest ? s.accountRequiredMessage : s.noHistoryFoundSub,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyM.copyWith(
                color: isDark
                    ? AppColors.darkMutedForeground
                    : AppColors.neutral500,
              ),
            ),
            if (isGuest) ...[
              SizedBox(height: 20.h),
              ElevatedButton.icon(
                onPressed: () =>
                    GoRouter.of(context).push(AppRoutes.signInScreen),
                icon:
                    Icon(Icons.login_rounded, size: 18.sp, color: Colors.white),
                label: Text(
                  s.signInOrRegister,
                  style: AppTextStyles.titleM.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
