import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.onTap,
    this.currentIndex = 0,
  });

  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final s = S.of(context);

    final navItems = [
      _NavItemData(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: s.nav_home,
      ),
      _NavItemData(
        icon: Icons.history_outlined,
        activeIcon: Icons.history_rounded,
        label: s.nav_history,
      ),
      _NavItemData(
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: s.nav_profile,
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkCard.withValues(alpha: 0.96)
                : Colors.white.withValues(alpha: 0.96),
            borderRadius: BorderRadius.circular(28.r),
            border: Border.all(
              color: isDark
                  ? AppColors.darkBorder
                  : AppColors.neutral200.withValues(alpha: 0.8),
              width: 1.2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary
                    .withValues(alpha: isDark ? 0.25 : 0.08),
                blurRadius: 24.r,
                offset: const Offset(0, 8),
                spreadRadius: -2,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.04),
                blurRadius: 10.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final isSelected = currentIndex == index;
              final item = navItems[index];

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onTap?.call(index);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isDark
                              ? AppColors.primary.withValues(alpha: 0.2)
                              : AppColors.primary.withValues(alpha: 0.1))
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1.1 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isSelected ? item.activeIcon : item.icon,
                            size: 24.sp,
                            color: isSelected
                                ? (isDark
                                    ? AppColors.primaryGlow
                                    : AppColors.primary)
                                : (isDark
                                    ? AppColors.darkMutedForeground
                                    : AppColors.neutral500),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: isSelected
                              ? AppTextStyles.labelL.copyWith(
                                  color: isDark
                                      ? AppColors.primaryGlow
                                      : AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                )
                              : AppTextStyles.labelM.copyWith(
                                  color: isDark
                                      ? AppColors.darkMutedForeground
                                      : AppColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                          child: Text(
                            item.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
