import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/experience_level.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/list_selection_card.dart';

class ExperienceLevelScreen extends StatefulWidget {
  final String stepLabel;
  final int currentStep;

  const ExperienceLevelScreen({
    super.key,
    this.stepLabel = 'Step 2 of 5',
    this.currentStep = 2,
  });

  @override
  State<ExperienceLevelScreen> createState() => _ExperienceLevelScreenState();
}

class _ExperienceLevelScreenState extends State<ExperienceLevelScreen> {
  ExperienceLevel? selected;

  void _onSelected(ExperienceLevel level) {
    setState(() => selected = level);
    if (selected == null) return;
    context.push(AppRoutes.jobDescriptionScreen, extra: selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: 'Your experience level',
              subTitle: "We'll calibrate expectations, not difficulty.",
              currentStep: widget.currentStep,
              stepLabel: widget.stepLabel,
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
                    title: level.title,
                    subtitle: level.subtitle,
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
