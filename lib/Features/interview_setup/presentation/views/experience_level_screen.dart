import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/experience_level.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/list_selection_card.dart';
import 'package:interview_app/generated/l10n.dart';

class ExperienceLevelScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const ExperienceLevelScreen({super.key, required this.interviewSetupModel});

  @override
  State<ExperienceLevelScreen> createState() => _ExperienceLevelScreenState();
}

class _ExperienceLevelScreenState extends State<ExperienceLevelScreen> {
  ExperienceLevel? selected;

  void _onSelected(ExperienceLevel level) {
    setState(() => selected = level);
    if (selected == null) return;
    InterviewSetupModel setupModel = widget.interviewSetupModel.copyWith(
      experience: level,
    );
    context.push(AppRoutes.jobDescriptionScreen, extra: setupModel);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: s.experienceLevel,
              subTitle: s.chooseExperience,
              currentStep: 2,
              stepLabel: s.step2of6,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: ExperienceLevel.values.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final level = ExperienceLevel.values[index];
                  return ListSelectionCard(
                    title: level.getTitle(s),
                    subtitle: level.getSubtitle(s),
                    icon: level.icon,
                    iconColor: level.color,
                    isSelected: selected == level,
                    onTap: () => _onSelected(level),
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
