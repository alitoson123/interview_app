import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/mock/track_data.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/mock/track_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/selection_card.dart';
import 'package:interview_app/generated/l10n.dart';

class TrackSelectionScreen extends StatefulWidget {
  const TrackSelectionScreen({super.key});

  @override
  State<TrackSelectionScreen> createState() => _TrackSelectionScreenState();
}

class _TrackSelectionScreenState extends State<TrackSelectionScreen> {
  TrackModel? selectedTrack;

  void _onTrackSelected(TrackModel track) {
    setState(() => selectedTrack = track);

    final setupModel = InterviewSetupModel.empty(track: track.title);
    if (track.requiresTechnologySelection) {
      context.push(AppRoutes.technologySelectionScreen, extra: setupModel);
    } else {
      context.push(AppRoutes.experienceLevelScreen, extra: setupModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: s.trackSelection,
              subTitle: s.chooseTrackDomain,
              currentStep: 1,
              stepLabel: s.step1of6,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 50.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.2,
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
