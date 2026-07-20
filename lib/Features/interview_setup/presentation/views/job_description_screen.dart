import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_setup_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionScreen extends StatefulWidget {
  final InterviewSetupModel interviewSetupModel;

  const JobDescriptionScreen({super.key, required this.interviewSetupModel});

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _uploadedFileName;

  static const int _maxChars = 4000;

  bool get _hasContent =>
      _textController.text.trim().isNotEmpty || _uploadedFileName != null;

  void _onContinue() {
    InterviewSetupModel setupModel = widget.interviewSetupModel.copyWith(
      jobDescription: _textController.text,
    );

    context.push(AppRoutes.interviewTypeScreen, extra: setupModel);
  }

  void _onSkip() {
    context.push(
      AppRoutes.interviewTypeScreen,
      extra: widget.interviewSetupModel,
    );
  }

  /// Simulates PDF pick. Replace with real file_picker integration.
  void _pickFile() {
    setState(() => _uploadedFileName = 'resume.pdf');
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
      backgroundColor: const Color(0xffF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: s.pasteJobDescription,
              subTitle: s.optionalTailor,
              currentStep: 3,
              stepLabel: s.step3of6,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Text paste area ──────────────────────────────────
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _textController,
                      builder: (context, value, _) {
                        final charCount = value.text.length;
                        final isParsed = charCount > 50;
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.neutral200),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: _textController,
                                maxLength: _maxChars,
                                maxLines: 8,
                                style: AppTextStyles.bodyM.copyWith(
                                  color: AppColors.neutral800,
                                ),
                                decoration: InputDecoration(
                                  hintText: s.pasteJobDescriptionHint,
                                  hintStyle: AppTextStyles.bodyM.copyWith(
                                    color: AppColors.neutral400,
                                  ),
                                  contentPadding: EdgeInsets.all(16.w),
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                              Divider(color: AppColors.neutral100, height: 1),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '$charCount / $_maxChars ${s.chars}',
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.neutral400,
                                      ),
                                    ),
                                    if (isParsed)
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.auto_awesome,
                                            size: 12.sp,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            s.aiParsed,
                                            style: AppTextStyles.caption
                                                .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    // ── OR divider ───────────────────────────────────────
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.neutral200)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.neutral200),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              s.or,
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.neutral500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColors.neutral200)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    // ── PDF upload button ────────────────────────────────
                    GestureDetector(
                      onTap: _pickFile,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        decoration: BoxDecoration(
                          color: _uploadedFileName != null
                              ? AppColors.primary.withOpacity(0.05)
                              : Colors.white,
                          border: Border.all(
                            color: _uploadedFileName != null
                                ? AppColors.primary
                                : AppColors.neutral300,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _uploadedFileName != null
                                  ? Icons.check_circle_outline
                                  : Icons.upload_outlined,
                              color: _uploadedFileName != null
                                  ? AppColors.primary
                                  : AppColors.neutral600,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              _uploadedFileName != null
                                  ? _uploadedFileName!
                                  : s.uploadPdfResumeJD,
                              style: AppTextStyles.labelL.copyWith(
                                color: _uploadedFileName != null
                                    ? AppColors.primary
                                    : AppColors.neutral600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
            // ── Bottom action ────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _onSkip,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.neutral300),
                        minimumSize: Size(double.infinity, 56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                      ),
                      child: Text(
                        s.skip,
                        style: AppTextStyles.titleM.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _hasContent ? _onContinue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        disabledBackgroundColor: AppColors.neutral300,
                        minimumSize: Size(double.infinity, 56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            s.continuee,
                            style: AppTextStyles.titleM.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
