import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            SizedBox(height: 25.h),
            const ResumeInterviewCard(),
            SizedBox(height: 25.h),
            const InterviewTrackGrid(),
            SizedBox(height: 100.h), // Extra padding for the FAB and bottom bar
          ],
        ),
      ),
    );
  }
}