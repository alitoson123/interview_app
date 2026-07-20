import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_type.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/list_selection_card.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewTypeScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const InterviewTypeScreen({super.key, required this.interviewSetupModel});

  @override
  State<InterviewTypeScreen> createState() => _InterviewTypeScreenState();
}

class _InterviewTypeScreenState extends State<InterviewTypeScreen> {
  InterviewType? selected;

  void _onSelected(InterviewType type) {
    setState(() => selected = type);
    if (selected == null) return;
    InterviewSetupModel setupModel =
        widget.interviewSetupModel.copyWith(type: type);
    context.push(AppRoutes.difficultyScreen, extra: setupModel);
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
              title: s.interviewType,
              subTitle: s.interviewTypeSubtitle,
              currentStep: 4,
              stepLabel: s.step4of6,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: InterviewType.values.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12.h);
                },
                itemBuilder: (context, index) {
                  final type = InterviewType.values[index];
                  return ListSelectionCard(
                    title: type.getTitle(s),
                    subtitle: type.getSubtitle(s),
                    icon: type.icon,
                    iconColor: type.color,
                    isSelected: selected == type,
                    onTap: () => _onSelected(type),
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
