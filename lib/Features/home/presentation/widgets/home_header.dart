import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final user = getIt<AuthService>().user;
    final userName = user?.displayName ?? 'User';
    final initials = userName.isNotEmpty
        ? userName
              .trim()
              .split(' ')
              .map((e) => e.isNotEmpty ? e[0] : '')
              .take(2)
              .join()
              .toUpperCase()
        : 'U';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Text(
                initials,
                style: AppTextStyles.titleM.copyWith(color: AppColors.primary),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.good_morning,
                  style: AppTextStyles.labelL.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                Text(
                  userName,
                  style: AppTextStyles.titleM.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                iconSize: 18.sp,
                onPressed: () {
                  getIt<AuthService>().signOutMethod();
                  context.go(AppRoutes.signInScreen);
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  color: AppColors.neutral900,
                ),
              ),
            ),
            /*   Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: AppColors.neutral900,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.destructive,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ],
    );
  }
}
