import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/difficulty.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/continue_button.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/list_selection_card.dart';

class DifficultyScreen extends StatefulWidget {
  final String stepLabel;
  final int currentStep;

  const DifficultyScreen({
    super.key,
    this.stepLabel = 'Step 4 of 5',
    this.currentStep = 4,
  });

  @override
  State<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  Difficulty? _selected;

  void _onContinue() {
    if (_selected == null) return;
    // TODO: Navigate to Interview Type or Review screen.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: 'Pick a difficulty',
              subTitle: 'Independent of experience — challenge yourself.',
              currentStep: widget.currentStep,
              stepLabel: widget.stepLabel,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  // Difficulty cards
                  ...Difficulty.values.map((difficulty) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: ListSelectionCard(
                        title: difficulty.title,
                        subtitle: difficulty.subtitle,
                        icon: difficulty.icon,
                        iconColor: difficulty.color,
                        isSelected: _selected == difficulty,
                        onTap: () => setState(() => _selected = difficulty),
                      ),
                    );
                  }),
                  SizedBox(height: 8.h),
                  // Tip card
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tip. ',
                            style: AppTextStyles.bodyM.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Try Junior + Hard for stretch practice, or Senior + Easy for a fluency drill.',
                            style: AppTextStyles.bodyM.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ContinueButton(
              onPressed: _selected != null ? _onContinue : null,
            ),
          ],
        ),
      ),
    );
  }
}
