import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/mock/track_data.dart';
import 'package:interview_app/generated/l10n.dart';
import 'interview_track_card.dart';

class InterviewTrackGrid extends StatelessWidget {
  const InterviewTrackGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.choose_interview_track,
              style: AppTextStyles.titleM.copyWith(color: AppColors.neutral900),
            ),
            TextButton(
              onPressed: () {
                context.push(AppRoutes.trackSelectionScreen);
              },
              child: Text(
                s.see_all,
                style: AppTextStyles.labelL.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mockInterviewTracks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 8.w,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            final track = mockInterviewTracks[index];
            return InterviewTrackCard(
              icon: track.icon,
              iconBackgroundColor: track.color.withOpacity(0.1),
              iconColor: track.color,
              title: track.title,
              subtitle: track.subtitle,
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
