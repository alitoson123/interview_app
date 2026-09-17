import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/history/presentation/views/history_view.dart';
import 'package:interview_app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/profile/presentation/views/profile_view.dart';
import 'package:interview_app/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const SafeArea(child: HomeViewBody()),
    const HistoryView(),
    Center(child: Text('statistics page')),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.trackSelectionScreen);
        },
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        elevation: 4,
        child: Icon(Icons.add, color: Colors.white, size: 40.sp),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.onTap, this.currentIndex = 0});

  List<BottomNavigationBarItem> items(s) => [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: s.nav_home),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: s.nav_history),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: s.nav_stats),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: s.nav_profile),
  ];
  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h),
      child: BottomNavigationBar(
        iconSize: 24.sp,
        selectedItemColor: isDark ? AppColors.primaryGlow : AppColors.primary,
        unselectedItemColor:
            isDark ? AppColors.darkMutedForeground : AppColors.neutral500,
        selectedLabelStyle: AppTextStyles.labelM.copyWith(
          color: isDark ? AppColors.primaryGlow : AppColors.primary,
        ),
        unselectedLabelStyle: AppTextStyles.labelM.copyWith(
          color: isDark ? AppColors.darkMutedForeground : AppColors.neutral500,
        ),
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: isDark ? AppColors.darkCard : Colors.white,
        items: items(S.of(context)),
      ),
    );
  }
}
