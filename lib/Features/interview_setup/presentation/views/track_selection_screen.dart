import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/mock/track_data.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/selection_card.dart';

class TrackSelectionScreen extends StatefulWidget {
  const TrackSelectionScreen({super.key});

  @override
  State<TrackSelectionScreen> createState() => _TrackSelectionScreenState();
}

class _TrackSelectionScreenState extends State<TrackSelectionScreen> {
  InterviewModel? selectedTrack;

  void _onTrackSelected(InterviewModel track) {
    setState(() => selectedTrack = track);

    if (track.requiresTechnologySelection) {
      context.push(AppRoutes.technologySelectionScreen, extra: track);
    } else {
      context.push(
        AppRoutes.experienceLevelScreen,
        extra: {'stepLabel': 'Step 2 of 5', 'currentStep': 2},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: 'Choose a track',
              subTitle: 'Choose the interview domain.',
              currentStep: 1,
              stepLabel: 'Step 1 of 5',
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.41,
                ),
                itemCount: mockInterviewTracks.length,
                itemBuilder: (context, index) {
                  final track = mockInterviewTracks[index];
                  return SelectionCard(
                    title: track.title,
                    subtitle: track.subtitle,
                    icon: track.icon,
                    iconColor: track.color,
                    isSelected: selectedTrack == track,
                    onTap: () => _onTrackSelected(track),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
