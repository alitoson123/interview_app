import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/job_description_bottom_actions.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/job_description_text_input.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const JobDescriptionScreen({super.key, required this.interviewSetupModel});

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  final TextEditingController _textController = TextEditingController();
  static const int _maxChars = 4000;

  bool get _hasContent => _textController.text.trim().isNotEmpty;

  void _onContinue() {
    final text = _textController.text.trim();
    final setupModel = widget.interviewSetupModel.copyWith(
      jobDescription: text.isNotEmpty ? text : null,
    );

    context.push(AppRoutes.interviewTypeScreen, extra: setupModel);
  }

  void _onSkip() {
    context.push(
      AppRoutes.interviewTypeScreen,
      extra: widget.interviewSetupModel,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: s.pasteJobDescription,
              subTitle: s.optionalTailor,
              currentStep: 3,
              stepLabel: s.step3of6,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobDescriptionTextInput(
                      controller: _textController,
                      maxChars: _maxChars,
                      onChanged: () => setState(() {}),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            JobDescriptionBottomActions(
              hasContent: _hasContent,
              onSkip: _onSkip,
              onContinue: _onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
