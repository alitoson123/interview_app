import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/mock/track_data.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/mock/technology_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/selection_card.dart';
import 'package:interview_app/generated/l10n.dart';

class TechnologySelectionScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const TechnologySelectionScreen({
    super.key,
    required this.interviewSetupModel,
  });

  @override
  State<TechnologySelectionScreen> createState() =>
      _TechnologySelectionScreenState();
}

class _TechnologySelectionScreenState extends State<TechnologySelectionScreen> {
  TechnologyModel? _selectedTechnology;

  void _onTechnologySelected(TechnologyModel technology) {
    setState(() => _selectedTechnology = technology);
    InterviewSetupModel setupModel = widget.interviewSetupModel.copyWith(
      technology: technology.title,
    );
    context.push(AppRoutes.experienceLevelScreen, extra: setupModel);
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
              title: widget.interviewSetupModel.track,
              subTitle: s.chooseTechnology,
              currentStep: 1,
              stepLabel: s.step1of6,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.3,
                ),
                itemCount: mockInterviewTracks
                    .where(
                      (track) =>
                          track.title == widget.interviewSetupModel.track,
                    )
                    .first
                    .technologies
                    .length,
                itemBuilder: (context, index) {
                  final technology = mockInterviewTracks
                      .where(
                        (track) =>
                            track.title == widget.interviewSetupModel.track,
                      )
                      .first
                      .technologies[index];
                  return SelectionCard(
                    title: technology.title,
                    icon: technology.icon,
                    iconColor: technology.color,
                    isSelected: _selectedTechnology == technology,
                    onTap: () => _onTechnologySelected(technology),
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
