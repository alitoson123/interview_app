import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:interview_app/Features/profile/presentation/widgets/delete_account_dialog.dart';
import 'package:interview_app/Features/profile/presentation/widgets/logout_dialog.dart';
import 'package:interview_app/Features/profile/presentation/widgets/profile_action_tile.dart';
import 'package:interview_app/generated/l10n.dart';

class ProfileActionsList extends StatelessWidget {
  const ProfileActionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          ProfileActionTile(
            icon: Icons.description_outlined,
            title: s.myResumeAndRole,
            iconColor: AppColors.primary,
            isDark: isDark,
            onTap: () => context.push(AppRoutes.trackSelectionScreen),
          ),
          SizedBox(height: 12.h),
          ProfileActionTile(
            icon: Icons.settings_outlined,
            title: s.appSettings,
            iconColor: AppColors.neutral600,
            isDark: isDark,
            onTap: () => context.push(AppRoutes.settingsScreen),
          ),
          SizedBox(height: 12.h),
          ProfileActionTile(
            icon: Icons.logout_rounded,
            title: s.logOut,
            iconColor: AppColors.destructive,
            isDestructive: true,
            isDark: isDark,
            onTap: () {
              LogoutDialog.show(
                context,
                onConfirm: () {
                  context.read<ProfileCubit>().signOut();
                },
              );
            },
          ),
          SizedBox(height: 12.h),
          ProfileActionTile(
            icon: Icons.delete_forever_outlined,
            title: s.deleteAccount,
            iconColor: AppColors.destructive,
            isDestructive: true,
            isDark: isDark,
            onTap: () {
              DeleteAccountDialog.show(
                context,
                onConfirm: () {
                  context.read<ProfileCubit>().deleteAccount();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
