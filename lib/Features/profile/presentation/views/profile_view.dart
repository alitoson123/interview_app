import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/helpers/message.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/Features/profile/data/repo_impl/profile_repo_impl.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_state.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_actions_list.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_header.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_stats_card.dart';
import 'package:interview_app/Features/profile/presentation/widgets/reauth_dialog.dart';
import 'package:interview_app/generated/l10n.dart';

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
    final s = S.of(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is ProfileLoggedOut ||
          current is ProfileActionLoading ||
          current is ProfileActionError ||
          current is ProfileRequiresReauth ||
          current is ProfileLoaded,
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          EasyLoading.dismiss();
          Message.messageSuccessMethod(
            context,
            message: s.accountDeletedSuccess,
          );
          context.go(AppRoutes.signInScreen);
        } else if (state is ProfileActionLoading) {
          EasyLoading.show(status: s.loading);
        } else if (state is ProfileActionError) {
          EasyLoading.dismiss();
          Message.showAppDialog(
            context: context,
            message: state.message,
            type: DialogType.error,
          );
        } else if (state is ProfileRequiresReauth) {
          EasyLoading.dismiss();
          ReauthDialog.show(
            context,
            providers: state.providers,
            onPasswordConfirmed: (password) {
              context
                  .read<ProfileCubit>()
                  .reauthenticateWithPasswordAndDelete(password);
            },
            onGoogleConfirmed: () {
              context
                  .read<ProfileCubit>()
                  .reauthenticateWithGoogleAndDelete();
            },
            onAppleConfirmed: () {
              context
                  .read<ProfileCubit>()
                  .reauthenticateWithAppleAndDelete();
            },
            onLoginAgain: () {
              context.read<ProfileCubit>().signOut();
            },
          );
        } else if (state is ProfileLoaded) {
          EasyLoading.dismiss();
        }
      },
      buildWhen: (previous, current) =>
          current is ProfileLoading ||
          current is ProfileLoaded ||
          current is ProfileError,
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProfileError) {
          return ProfileErrorWidget(state: state);
        }

        if (state is ProfileLoaded) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () => context.read<ProfileCubit>().loadProfile(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
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
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class ProfileErrorWidget extends StatelessWidget {
  const ProfileErrorWidget({super.key, required this.state});
  final ProfileError state;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: AppColors.destructive),
            SizedBox(height: 12.h),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyM,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () => context.read<ProfileCubit>().loadProfile(),
              child: Text(s.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
