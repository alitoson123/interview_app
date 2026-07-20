import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/difficulty.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/list_selection_card.dart';
import 'package:interview_app/generated/l10n.dart';

class DifficultyScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const DifficultyScreen({super.key, required this.interviewSetupModel});

  @override
  State<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  Difficulty? selected;

  void _onSelected(Difficulty difficulty) {
    setState(() => selected = difficulty);
    if (selected == null) return;
    InterviewSetupModel setupModel = widget.interviewSetupModel.copyWith(
      difficulty: difficulty,
    );
    context.push(AppRoutes.interviewReviewScreen, extra: setupModel);
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
              title: s.pickADifficulty,
              subTitle: s.independentOfExperience,
              currentStep: 5,
              stepLabel: s.step5of6,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   itemCount: Difficulty.values.length + 1,
                itemCount: Difficulty.values.length,
                separatorBuilder: (context, index) {
                  /*  if (index == Difficulty.values.length - 1) {
                    return SizedBox(height: 20.h);
                  }*/
                  return SizedBox(height: 12.h);
                },
                itemBuilder: (context, index) {
                  /* if (index == Difficulty.values.length) {
                    // Tip card
                    return Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: s.tip,
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: s.difficultyTipMessage,
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
*/
                  final difficulty = Difficulty.values[index];
                  return ListSelectionCard(
                    title: difficulty.getTitle(s),
                    subtitle: difficulty.getSubtitle(s),
                    icon: difficulty.icon,
                    iconColor: difficulty.color,
                    isSelected: selected == difficulty,
                    onTap: () => _onSelected(difficulty),
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
