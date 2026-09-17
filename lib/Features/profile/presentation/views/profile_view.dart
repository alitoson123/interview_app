import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/profile/data/repo_impl/profile_repo_impl.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_state.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_actions_list.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_header.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_stats_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(profileRepo: getIt<ProfileRepoImpl>())..loadProfile(),
      child: const _ProfileViewBody(),
    );
  }
}

class _ProfileViewBody extends StatelessWidget {
  const _ProfileViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          context.go(AppRoutes.signInScreen);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProfileError) {
          return ErrorWiget(state: state);
        }

        if (state is ProfileLoaded) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ProfileHeader(user: state.user, stats: state.stats),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -60.h,
                        child: ProfileStatsCard(stats: state.stats),
                      ),
                    ],
                  ),

                  SizedBox(height: 90.h),
                  const ProfileActionsList(),
                  SizedBox(height: 90.h),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class ErrorWiget extends StatelessWidget {
  const ErrorWiget({super.key, required this.state});
  final ProfileError state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48.sp, color: AppColors.destructive),
          SizedBox(height: 12.h),
          Text(state.message),
          SizedBox(height: 12.h),
          ElevatedButton(
            onPressed: () => context.read<ProfileCubit>().loadProfile(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
