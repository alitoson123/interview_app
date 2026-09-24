import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/history/data/repo_impl/history_repo_impl.dart';
import 'package:interview_app/Features/history/presentation/views/history_view.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_cubit.dart';
import 'package:interview_app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:interview_app/Features/home/presentation/widgets/my_bottom_nav_bar.dart';
import 'package:interview_app/Features/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> screens = const [
    SafeArea(child: HomeViewBody()),
    HistoryView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecentInterviewCubit(
        historyRepo: getIt<HistoryRepoImpl>(),
      )..fetchRecentInProgressInterview(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            
            body: IndexedStack(index: currentIndex, children: screens),
            bottomNavigationBar: MyBottomNavBar(
              currentIndex: currentIndex,
              onTap: (value) {
                if (value == 0 && currentIndex != 0) {
                  context
                      .read<RecentInterviewCubit>()
                      .fetchRecentInProgressInterview();
                }
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                height: 56.h,
                width: 56.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.45),
                      blurRadius: 16.r,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.35),
                    width: 1.5.w,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () async {
                      HapticFeedback.lightImpact();
                      await context.push(AppRoutes.trackSelectionScreen);
                      if (context.mounted) {
                        context
                            .read<RecentInterviewCubit>()
                            .fetchRecentInProgressInterview();
                      }
                    },
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
