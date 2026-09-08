import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/candidate_text_input.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/candidate_voice_recorder.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interview_action_bottom_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interview_session_header.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interviewer_avatar_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/model_answer_card.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/question_card.dart';
import 'package:interview_app/generated/l10n.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InterviewSessionScreen extends StatefulWidget {
  final InterviewSession session;

  const InterviewSessionScreen({super.key, required this.session});

  @override
  State<InterviewSessionScreen> createState() => _InterviewSessionScreenState();
}

class _InterviewSessionScreenState extends State<InterviewSessionScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();
  final TextEditingController _textController = TextEditingController();

  int _currentIndex = 0;
  bool _isSpeaking = false;
  bool _isListening = false;
  bool _isVoiceMode = true;
  bool _isAnswerSubmitted = false;
  String _userAnswer = '';

  List<InterviewQuestionsModel> get _questions => widget.session.questions;
  InterviewQuestionsModel get _currentQuestion => _questions[_currentIndex];

  @override
  void initState() {
    super.initState();
    _initAudioServices();
  }

  Future<void> _initAudioServices() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.48);
    _flutterTts.setStartHandler(() => setState(() => _isSpeaking = true));
    _flutterTts.setCompletionHandler(() => setState(() => _isSpeaking = false));
    _flutterTts.setErrorHandler((_) => setState(() => _isSpeaking = false));

    await _speechToText.initialize(
      onError: (_) => setState(() => _isListening = false),
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
        }
      },
    );

    _speakCurrentQuestion();
  }

  Future<void> _speakCurrentQuestion() async {
    if (_questions.isNotEmpty) {
      await _flutterTts.stop();
      await _flutterTts.speak(_currentQuestion.modelQuestion);
    }
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speechToText.stop();
      setState(() => _isListening = false);
    } else {
      if (_isSpeaking) await _flutterTts.stop();
      final available = await _speechToText.initialize();
      if (available) {
        setState(() => _isListening = true);
        await _speechToText.listen(
          onResult: (result) {
            setState(() {
              _userAnswer = result.recognizedWords;
              _textController.text = result.recognizedWords;
            });
          },
        );
      }
    }
  }

  void _submitAnswer() {
    if (_isListening) _speechToText.stop();
    if (_isSpeaking) _flutterTts.stop();
    setState(() => _isAnswerSubmitted = true);
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _isAnswerSubmitted = false;
        _userAnswer = '';
        _textController.clear();
      });
      _speakCurrentQuestion();
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _confirmExit() async {
    final s = S.of(context);
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.exitInterview, style: AppTextStyles.titleM),
        content: Text(s.exitInterviewConfirm, style: AppTextStyles.bodyM),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(s.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              s.exit,
              style: const TextStyle(color: AppColors.destructive),
            ),
          ),
        ],
      ),
    );
    if (shouldExit == true && mounted) {
      await _flutterTts.stop();
      await _speechToText.stop();
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _speechToText.stop();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _questions.length - 1;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            InterviewSessionHeader(
              currentIndex: _currentIndex,
              totalQuestions: _questions.length,
              track: widget.session.config.track,
              onClose: _confirmExit,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    InterviewerAvatarCard(
                      isSpeaking: _isSpeaking,
                      isListening: _isListening,
                      onReplay: _speakCurrentQuestion,
                    ),
                    SizedBox(height: 16.h),
                    QuestionCard(
                      questionNumber: _currentIndex + 1,
                      questionText: _currentQuestion.modelQuestion,
                    ),
                    SizedBox(height: 16.h),
                    if (!_isAnswerSubmitted) ...[
                      if (_isVoiceMode)
                        CandidateVoiceRecorder(
                          isListening: _isListening,
                          recognizedText: _userAnswer,
                          onToggleListening: _toggleListening,
                        )
                      else
                        CandidateTextInput(
                          controller: _textController,
                          onChanged: (val) => setState(() => _userAnswer = val),
                        ),
                    ] else ...[
                      ModelAnswerCard(
                        modelAnswer: _currentQuestion.modelAnswer,
                      ),
                      SizedBox(height: 16.h),
                      _buildTranscriptionBox(S.of(context)),
                    ],
                  ],
                ),
              ),
            ),
            InterviewActionBottomBar(
              isAnswerSubmitted: _isAnswerSubmitted,
              isLastQuestion: isLast,
              isVoiceMode: _isVoiceMode,
              hasAnswer: _userAnswer.trim().isNotEmpty,
              onToggleMode: () async {
                if (_isListening) {
                  await _speechToText.stop();
                  setState(() => _isListening = false);
                }

                setState(() => _isVoiceMode = !_isVoiceMode);
              },
              onSubmitAnswer: _submitAnswer,
              onNextQuestion: _nextQuestion,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranscriptionBox(S s) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 90.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.neutral200, width: 1.0),
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
            _userAnswer,
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutral900,
              fontStyle: FontStyle.normal ,
            ),
          ),
        ],
      ),
    );
  }
}
