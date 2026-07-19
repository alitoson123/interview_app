import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.neutral200, width: 1),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 72.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: s.nav_home,
                isActive: true,
                onTap: () {},
              ),
              _NavBarItem(
                icon: Icons.access_time,
                activeIcon: Icons.access_time_filled,
                label: s.nav_history,
                isActive: false,
                onTap: () {},
              ),
              // Spacer for the FAB
              SizedBox(width: 48.w),
              _NavBarItem(
                icon: Icons.bar_chart,
                activeIcon: Icons.bar_chart,
                label: s.nav_stats,
                isActive: false,
                onTap: () {},
              ),
              _NavBarItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: s.nav_profile,
                isActive: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.neutral500;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: color,
              size: 24.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.labelM.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
