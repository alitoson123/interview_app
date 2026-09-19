import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_cubit.dart';
import 'package:interview_app/Features/home/presentation/view_model/recent_interview_cubit/recent_interview_state.dart';
import 'home_header.dart';
import 'resume_interview_card.dart';
import 'interview_track_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            BlocBuilder<RecentInterviewCubit, RecentInterviewState>(
              builder: (context, state) {
                if (state is RecentInterviewLoaded && state.session != null) {
                  return Column(
                    children: [
                      SizedBox(height: 25.h),
                      const ResumeInterviewCard(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            SizedBox(height: 25.h),
            const InterviewTrackGrid(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}