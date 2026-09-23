import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/domain/repo/interview_repo.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/interview_session_cubit/interview_session_state.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InterviewSessionCubit extends Cubit<InterviewSessionState> {
  final FlutterTts _flutterTts;
  final SpeechToText _speechToText;
  final InterviewRepo _interviewRepo;
  final DateTime _startTime;

  InterviewSessionCubit({
    required InterviewSessionModel session,
    int initialIndex = 0,
    InterviewRepo? interviewRepo,
    FlutterTts? flutterTts,
    SpeechToText? speechToText,
  }) : _flutterTts = flutterTts ?? FlutterTts(),
       _speechToText = speechToText ?? SpeechToText(),
       _interviewRepo = interviewRepo ?? getIt<InterviewRepoImpl>(),
       _startTime = DateTime.now(),
       super(
         InterviewSessionState(
           session: session,
           currentIndex: initialIndex.clamp(
             0,
             session.questions.isEmpty ? 0 : session.questions.length - 1,
           ),
         ),
       ) {
    _initAudioServices();
  }

  String? _speechLocaleId;

  Future<void> _initAudioServices() async {
    try {
      await _setupTts();
      final available = await _speechToText.initialize(
        onError: (_) =>
            !isClosed ? emit(state.copyWith(isListening: false)) : null,
        onStatus: (s) {
          if ((s == 'done' || s == 'notListening') && !isClosed) {
            emit(state.copyWith(isListening: false));
          }
        },
      );
      if (available) {
        await _detectSpeechLocale();
      }
      speakCurrentQuestion();
    } catch (e) {
      if (!isClosed) emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _setupTts() async {
    try {
      final isEgAvailable = await _flutterTts.isLanguageAvailable("ar-EG");
      if (isEgAvailable == true) {
        await _flutterTts.setLanguage("ar-EG");
      } else {
        await _flutterTts.setLanguage("ar");
      }
    } catch (_) {
      try {
        await _flutterTts.setLanguage("ar");
      } catch (_) {}
    }
    await _flutterTts.setSpeechRate(0.48);
    _flutterTts.setStartHandler(
      () => !isClosed ? emit(state.copyWith(isSpeaking: true)) : null,
    );
    _flutterTts.setCompletionHandler(
      () => !isClosed ? emit(state.copyWith(isSpeaking: false)) : null,
    );
    _flutterTts.setErrorHandler(
      (_) => !isClosed ? emit(state.copyWith(isSpeaking: false)) : null,
    );
  }

  Future<void> _detectSpeechLocale() async {
    try {
      final locales = await _speechToText.locales();
      final arLocale = locales.where((l) {
        final id = l.localeId.toLowerCase().replaceAll('-', '_');
        return id.startsWith('ar_') || id == 'ar';
      }).firstOrNull;
      if (arLocale != null) {
        _speechLocaleId = arLocale.localeId;
      }
    } catch (_) {}
  }

  Future<void> speakCurrentQuestion() async {
    if (state.session.questions.isEmpty) return;
    try {
      await _flutterTts.stop();
      await _flutterTts.speak(state.currentQuestion.modelQuestion);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> toggleListening() async {
    if (state.isListening) {
      await _speechToText.stop();
      emit(state.copyWith(isListening: false));
    } else {
      if (state.isSpeaking) await _flutterTts.stop();
      final available = await _speechToText.initialize();
      if (available) {
        if (_speechLocaleId == null) {
          await _detectSpeechLocale();
        }
        emit(state.copyWith(isListening: true));
        await _speechToText.listen(
          localeId: _speechLocaleId,
          onResult: (result) {
            if (!isClosed) {
              emit(state.copyWith(currentAnswer: result.recognizedWords));
            }
          },
        );
      }
    }
  }

  void updateAnswer(String text) => emit(state.copyWith(currentAnswer: text));

  void toggleInputMode() =>
      emit(state.copyWith(isVoiceMode: !state.isVoiceMode));

  void submitAnswer() {
    if (state.isListening) _speechToText.stop();
    if (state.isSpeaking) _flutterTts.stop();
    _saveAnswer(state.currentAnswer);
  }

  void skipQuestion() {
    if (state.isListening) _speechToText.stop();
    if (state.isSpeaking) _flutterTts.stop();
    _saveAnswer('');
  }

  void _saveAnswer(String answer) {
    final updated = List<InterviewQuestionsModel>.from(state.session.questions);
    updated[state.currentIndex] = state.currentQuestion.copyWith(
      userAnswer: answer,
    );
    final updatedSession = state.session.copyWith(questions: updated);
    _interviewRepo.updateInterviewSession(session: updatedSession);

    emit(
      state.copyWith(
        session: updatedSession,
        isAnswerSubmitted: true,
        isListening: false,
        isSpeaking: false,
      ),
    );
  }

  void nextQuestion() {
    if (!state.isLastQuestion) {
      emit(
        state.copyWith(
          currentIndex: state.currentIndex + 1,
          isAnswerSubmitted: false,
          currentAnswer: '',
        ),
      );
      speakCurrentQuestion();
    } else {
      final elapsed = DateTime.now().difference(_startTime);
      final completedSession = state.session.copyWith(
        status: InterviewStatus.completed,
      );
      _interviewRepo.updateInterviewSession(session: completedSession);
      emit(
        state.copyWith(
          session: completedSession,
          isCompleted: true,
          duration: elapsed,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _flutterTts.stop();
    await _speechToText.stop();
    return super.close();
  }
}
