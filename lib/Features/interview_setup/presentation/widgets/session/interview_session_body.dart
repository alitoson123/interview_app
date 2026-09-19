import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/interview_session_cubit/interview_session_cubit.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/interview_session_cubit/interview_session_state.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/candidate_text_input.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/candidate_voice_recorder.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interview_action_bottom_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interview_session_header.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interviewer_avatar_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/model_answer_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/question_card.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class InterviewSessionBody extends StatefulWidget {
  final VoidCallback onExit;

  const InterviewSessionBody({super.key, required this.onExit});

  @override
  State<InterviewSessionBody> createState() => _InterviewSessionBodyState();
}

class _InterviewSessionBodyState extends State<InterviewSessionBody> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InterviewSessionCubit, InterviewSessionState>(
      listener: (context, state) {
        if (_textController.text != state.currentAnswer) {
          _textController.text = state.currentAnswer;
        }
        if (state.isCompleted) {
          context.pushReplacement(
            AppRoutes.interviewSummaryScreen,
            extra: (state.session, state.duration),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<InterviewSessionCubit>();

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                InterviewSessionHeader(
                  currentIndex: state.currentIndex,
                  totalQuestions: state.totalQuestions,
                  track: state.session.config.track,
                  onClose: widget.onExit,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        InterviewerAvatarCard(
                          isSpeaking: state.isSpeaking,
                          isListening: state.isListening,
                          onReplay: cubit.speakCurrentQuestion,
                        ),
                        SizedBox(height: 16.h),
                        QuestionCard(
                          questionNumber: state.currentIndex + 1,
                          questionText: state.currentQuestion.modelQuestion,
                        ),
                        SizedBox(height: 16.h),
                        if (!state.isAnswerSubmitted) ...[
                          if (state.isVoiceMode)
                            CandidateVoiceRecorder(
                              isListening: state.isListening,
                              recognizedText: state.currentAnswer,
                              onToggleListening: cubit.toggleListening,
                            )
                          else
                            CandidateTextInput(
                              controller: _textController,
                              onChanged: cubit.updateAnswer,
                            ),
                        ] else ...[
                          ModelAnswerCard(
                            modelAnswer: state.currentQuestion.modelAnswer,
                          ),
                          SizedBox(height: 16.h),
                          _buildTranscriptionBox(
                            S.of(context),
                            state.currentAnswer,
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ],
                    ),
                  ),
                ),
                InterviewActionBottomBar(
                  isAnswerSubmitted: state.isAnswerSubmitted,
                  isLastQuestion: state.isLastQuestion,
                  isVoiceMode: state.isVoiceMode,
                  hasAnswer: state.hasAnswer,
                  onToggleMode: cubit.toggleInputMode,
                  onSubmitAnswer: cubit.submitAnswer,
                  onNextQuestion: cubit.nextQuestion,
                  onSkipQuestion: cubit.skipQuestion,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTranscriptionBox(S s, String answerText) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 75.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.neutral200,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : const Color(0xFF1E293B).withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.yourAnswer,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.neutral500,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            answerText,
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutral900,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
