import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';

class InterviewSessionState {
  final InterviewSessionModel session;
  final int currentIndex;
  final bool isSpeaking;
  final bool isListening;
  final bool isVoiceMode;
  final String currentAnswer;
  final bool isAnswerSubmitted;
  final bool isCompleted;
  final Duration duration;
  final String? errorMessage;

  const InterviewSessionState({
    required this.session,
    this.currentIndex = 0,
    this.isSpeaking = false,
    this.isListening = false,
    this.isVoiceMode = true,
    this.currentAnswer = '',
    this.isAnswerSubmitted = false,
    this.isCompleted = false,
    this.duration = Duration.zero,
    this.errorMessage,
  });

  InterviewQuestionsModel get currentQuestion =>
      session.questions[currentIndex];

  int get totalQuestions => session.questions.length;

  int get answeredCount => session.questions
      .where((q) => q.userAnswer != null && q.userAnswer!.trim().isNotEmpty)
      .length;

  bool get isLastQuestion =>
      session.questions.isNotEmpty &&
      currentIndex == session.questions.length - 1;

  bool get hasAnswer => currentAnswer.trim().isNotEmpty;

  InterviewSessionState copyWith({
    InterviewSessionModel? session,
    int? currentIndex,
    bool? isSpeaking,
    bool? isListening,
    bool? isVoiceMode,
    String? currentAnswer,
    bool? isAnswerSubmitted,
    bool? isCompleted,
    Duration? duration,
    String? errorMessage,
  }) {
    return InterviewSessionState(
      session: session ?? this.session,
      currentIndex: currentIndex ?? this.currentIndex,
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isListening: isListening ?? this.isListening,
      isVoiceMode: isVoiceMode ?? this.isVoiceMode,
      currentAnswer: currentAnswer ?? this.currentAnswer,
      isAnswerSubmitted: isAnswerSubmitted ?? this.isAnswerSubmitted,
      isCompleted: isCompleted ?? this.isCompleted,
      duration: duration ?? this.duration,
      errorMessage: errorMessage,
    );
  }
}
