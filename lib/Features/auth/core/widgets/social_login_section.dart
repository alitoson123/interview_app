import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/constant/app_assets.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
    this.onGooglePressed,
    this.onApplePressed,
  });

  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: isDark ? AppColors.darkBorder : AppColors.neutral200,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                s.or_continue_with,
                style: AppTextStyles.labelL.copyWith(
                  color: isDark
                      ? AppColors.darkMutedForeground
                      : AppColors.neutral500,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: isDark ? AppColors.darkBorder : AppColors.neutral200,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.only(bottom: 100.h),
          child: Column(
            children: [
              // Google Sign-In button
              OutlinedButton(
                onPressed: () {
                  if (onGooglePressed != null) {
                    onGooglePressed!();
                  } else {
                    context.read<SignInCubit>().signInWithGoogleMethod();
                  }
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(56.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  side: BorderSide(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                  foregroundColor: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.googleIcon, width: 24.w, height: 24.h),
                    SizedBox(width: 12.w),
                    Text(
                      s.continue_with_google,
                      style: AppTextStyles.titleM.copyWith(
                        color: isDark
                            ? AppColors.darkForeground
                            : AppColors.neutral900,
                      ),
                    ),
                  ],
                ),
              ),
              if (isIOS) ...[
                SizedBox(height: 16.h),
                // Apple Sign-In button
                OutlinedButton(
                  onPressed: () {
                    if (onApplePressed != null) {
                      onApplePressed!();
                    } else {
                      context.read<SignInCubit>().signInWithAppleMethod();
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(56.h),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                    ),
                    foregroundColor: isDark
                        ? AppColors.darkForeground
                        : AppColors.neutral900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apple,
                        size: 26.sp,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        s.continue_with_apple,
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
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
