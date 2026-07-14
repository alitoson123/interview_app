import 'package:flutter/material.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/constant/app_shadow.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTabSwitcher extends StatelessWidget {
  final bool isLogin;
  final VoidCallback? onLoginTap;
  final VoidCallback? onRegisterTap;

  const AuthTabSwitcher({
    super.key,
    required this.isLogin,
    this.onLoginTap,
    this.onRegisterTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      height: 48.h,
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLoginTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: isLogin ? AppShadows.sm : null,
                ),
                child: Text(
                  s.logIn,
                  style: AppTextStyles.labelL.copyWith(
                    color: isLogin
                        ? AppColors.neutral900
                        : AppColors.neutral500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onRegisterTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: !isLogin ? AppShadows.sm : null,
                ),
                child: Text(
                  s.signUp,
                  style: AppTextStyles.labelL.copyWith(
                    color: !isLogin
                        ? AppColors.neutral900
                        : AppColors.neutral500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
