import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_questions_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/domain/repo/interview_repo.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/interview_session_cubit/interview_session_state.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
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
  String _baseAnswer = '';
  String _currentUtterance = '';
  Timer? _restartTimer;
  bool _userWantsListening = false;
  bool _isStartingSpeech = false;

  Future<void> _initAudioServices() async {
    try {
      await _setupTts();
      final available = await _speechToText.initialize(
        onError: _handleSpeechError,
        onStatus: _handleSpeechStatus,
      );
      if (available) {
        await _detectSpeechLocale();
      }
      await Future.delayed(const Duration(milliseconds: 350));
      await speakCurrentQuestion();
    } catch (e) {
      if (!isClosed) emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _setupTts() async {
    try {
      try {
        await _flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          ],
        );
      } catch (_) {}

      await _flutterTts.awaitSynthCompletion(true);
      await _applyArabicLanguageToTts();
    } catch (_) {}

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

  Future<void> _applyArabicLanguageToTts() async {
    try {
      try {
        final dynamic engines = await _flutterTts.getEngines;
        if (engines is List) {
          for (final e in engines) {
            final engineStr = e.toString();
            if (engineStr.contains('com.google.android.tts')) {
              await _flutterTts.setEngine('com.google.android.tts');
              break;
            }
          }
        }
      } catch (_) {}

      bool languageSet = false;
      final preferredLocales = [
        'ar-SA',
        'ar_SA',
        'ar-XA',
        'ar_XA',
        'ar-EG',
        'ar_EG',
        'ar-AE',
        'ar_AE',
        'ar',
      ];

      try {
        final dynamic languages = await _flutterTts.getLanguages;
        if (languages is List && languages.isNotEmpty) {
          final langList = languages.map((e) => e.toString()).toList();
          for (final pref in preferredLocales) {
            final match = langList.firstWhere(
              (l) =>
                  l.toLowerCase() == pref.toLowerCase() ||
                  l.toLowerCase().replaceAll('_', '-') ==
                      pref.toLowerCase().replaceAll('_', '-'),
              orElse: () => '',
            );
            if (match.isNotEmpty) {
              await _flutterTts.setLanguage(match);
              languageSet = true;
              break;
            }
          }
        }
      } catch (_) {}

      if (!languageSet) {
        for (final loc in preferredLocales) {
          try {
            final isAvailable = await _flutterTts.isLanguageAvailable(loc);
            if (isAvailable == true || isAvailable == 1) {
              await _flutterTts.setLanguage(loc);
              languageSet = true;
              break;
            }
          } catch (_) {}
        }
      }

      if (!languageSet) {
        try {
          await _flutterTts.setLanguage('ar-SA');
        } catch (_) {
          try {
            await _flutterTts.setLanguage('ar');
          } catch (_) {}
        }
      }

      try {
        final dynamic voices = await _flutterTts.getVoices;
        if (voices is List && voices.isNotEmpty) {
          for (final v in voices) {
            if (v is Map) {
              final locale = (v['locale'] ?? '').toString().toLowerCase();
              final name = (v['name'] ?? '').toString().toLowerCase();
              if (locale.startsWith('ar') ||
                  name.contains('arabic') ||
                  name.contains('ar-') ||
                  name.contains('ar_')) {
                await _flutterTts.setVoice({
                  'name': v['name'].toString(),
                  'locale': v['locale'].toString(),
                });
                break;
              }
            }
          }
        }
      } catch (_) {}

      await _flutterTts.setSpeechRate(0.48);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
    } catch (_) {}
  }

  String _prepareTextForTts(String text) {
    return text
        .replaceAll('الـ ', 'ال ')
        .replaceAll('الـ', 'ال ')
        .replaceAll('ـ', '')
        .replaceAll('*', '')
        .replaceAll('`', '')
        .replaceAll('#', '')
        .replaceAll('_', ' ')
        .trim();
  }

  Future<void> _detectSpeechLocale() async {
    try {
      final locales = await _speechToText.locales();
      if (locales.isNotEmpty) {
        final egLocale = locales.where((l) {
          final id = l.localeId.toLowerCase().replaceAll('-', '_');
          return id == 'ar_eg';
        }).firstOrNull;

        if (egLocale != null) {
          _speechLocaleId = egLocale.localeId;
          return;
        }

        final saLocale = locales.where((l) {
          final id = l.localeId.toLowerCase().replaceAll('-', '_');
          return id == 'ar_sa';
        }).firstOrNull;

        if (saLocale != null) {
          _speechLocaleId = saLocale.localeId;
          return;
        }

        final anyAr = locales.where((l) {
          final id = l.localeId.toLowerCase().replaceAll('-', '_');
          return id.startsWith('ar_') ||
              id == 'ar' ||
              l.name.toLowerCase().contains('arab');
        }).firstOrNull;

        if (anyAr != null) {
          _speechLocaleId = anyAr.localeId;
          return;
        }
      }
    } catch (_) {}

    _speechLocaleId ??= 'ar_EG';
  }

  void _handleSpeechStatus(String status) {
    if (isClosed) return;
    if (status == 'done' || status == 'notListening') {
      _commitCurrentUtterance();
      if (_userWantsListening) {
        _scheduleRestart();
      } else {
        emit(state.copyWith(isListening: false, currentAnswer: _baseAnswer));
      }
    }
  }

  void _handleSpeechError(SpeechRecognitionError error) {
    if (isClosed) return;
    _commitCurrentUtterance();
    if (_userWantsListening) {
      if (error.errorMsg == 'error_permission') {
        _userWantsListening = false;
        emit(
          state.copyWith(
            isListening: false,
            errorMessage: error.errorMsg,
            currentAnswer: _baseAnswer,
          ),
        );
      } else {
        _scheduleRestart();
      }
    } else {
      emit(state.copyWith(isListening: false, currentAnswer: _baseAnswer));
    }
  }

  void _onSpeechResult(String recognizedWords, bool finalResult) {
    final raw = recognizedWords.trim();
    if (raw.isEmpty) return;

    if (_currentUtterance.isEmpty) {
      _currentUtterance = raw;
    } else {
      if (raw.startsWith(_currentUtterance) || raw.contains(_currentUtterance)) {
        _currentUtterance = raw;
      } else {
        final currentWords = _currentUtterance.split(RegExp(r'\s+'));
        final rawWords = raw.split(RegExp(r'\s+'));

        if (rawWords.length >= currentWords.length &&
            rawWords.first == currentWords.first) {
          _currentUtterance = raw;
        } else {
          _baseAnswer = _mergeText(_baseAnswer, _currentUtterance);
          _currentUtterance = raw;
        }
      }
    }

    if (finalResult) {
      _commitCurrentUtterance();
    }

    final fullText = _mergeText(_baseAnswer, _currentUtterance);
    emit(state.copyWith(currentAnswer: fullText));
  }

  void _commitCurrentUtterance() {
    final chunk = _currentUtterance.trim();
    if (chunk.isNotEmpty) {
      _baseAnswer = _mergeText(_baseAnswer, chunk);
      _currentUtterance = '';
    }
  }

  String _mergeText(String base, String addition) {
    base = base.trim();
    addition = addition.trim();
    if (base.isEmpty) return addition;
    if (addition.isEmpty) return base;

    if (base == addition ||
        base.endsWith(' $addition') ||
        base.endsWith(addition)) {
      return base;
    }
    if (addition.startsWith('$base ') || addition.startsWith(base)) {
      return addition;
    }

    final baseWords = base.split(RegExp(r'\s+'));
    final additionWords = addition.split(RegExp(r'\s+'));

    int maxOverlap = 0;
    final maxCheck =
        baseWords.length < additionWords.length
            ? baseWords.length
            : additionWords.length;
    for (int len = 1; len <= maxCheck; len++) {
      final baseSuffix = baseWords.sublist(baseWords.length - len).join(' ');
      final additionPrefix = additionWords.sublist(0, len).join(' ');
      if (baseSuffix == additionPrefix) {
        maxOverlap = len;
      }
    }

    if (maxOverlap > 0) {
      final remainingAddition = additionWords.sublist(maxOverlap).join(' ');
      if (remainingAddition.isEmpty) return base;
      return '$base $remainingAddition';
    }

    return '$base $addition';
  }

  void _scheduleRestart() {
    _restartTimer?.cancel();
    if (!_userWantsListening || isClosed) return;
    _restartTimer = Timer(const Duration(milliseconds: 200), () {
      if (_userWantsListening && !isClosed) {
        _startListening();
      }
    });
  }

  Future<void> speakCurrentQuestion() async {
    if (state.session.questions.isEmpty) return;
    try {
      if (_userWantsListening || state.isListening) {
        _userWantsListening = false;
        _restartTimer?.cancel();
        await _speechToText.stop();
        _commitCurrentUtterance();
        emit(state.copyWith(isListening: false));
      }
      await _flutterTts.stop();
      await _applyArabicLanguageToTts();

      final rawText = state.currentQuestion.modelQuestion;
      final cleanText = _prepareTextForTts(rawText);
      if (cleanText.isNotEmpty) {
        await _flutterTts.speak(cleanText);
      }
    } catch (e) {
      if (!isClosed) emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _startListening() async {
    if (_isStartingSpeech || !_userWantsListening || isClosed) return;
    _isStartingSpeech = true;
    try {
      if (state.isSpeaking) {
        await _flutterTts.stop();
        if (!isClosed) emit(state.copyWith(isSpeaking: false));
      }

      if (_speechToText.isListening) {
        await _speechToText.stop();
        await Future.delayed(const Duration(milliseconds: 80));
      }

      bool isReady = _speechToText.isAvailable;
      if (!isReady) {
        isReady = await _speechToText.initialize(
          onError: _handleSpeechError,
          onStatus: _handleSpeechStatus,
        );
      }

      if (isReady && _userWantsListening && !isClosed) {
        if (_speechLocaleId == null) {
          await _detectSpeechLocale();
        }
        if (!state.isListening && !isClosed) {
          emit(state.copyWith(isListening: true));
        }
        await _speechToText.listen(
          onResult: (result) {
            if (!isClosed && _userWantsListening) {
              _onSpeechResult(result.recognizedWords, result.finalResult);
            }
          },
          listenOptions: SpeechListenOptions(
            localeId: _speechLocaleId ?? 'ar_EG',
            listenMode: ListenMode.dictation,
            partialResults: true,
            cancelOnError: false,
            listenFor: const Duration(minutes: 5),
            pauseFor: const Duration(seconds: 10),
          ),
        );
      }
    } catch (_) {
      if (_userWantsListening && !isClosed) {
        _scheduleRestart();
      }
    } finally {
      _isStartingSpeech = false;
    }
  }

  Future<void> toggleListening() async {
    if (_userWantsListening || state.isListening) {
      _userWantsListening = false;
      _restartTimer?.cancel();
      _commitCurrentUtterance();
      await _speechToText.stop();
      emit(state.copyWith(isListening: false, currentAnswer: _baseAnswer));
    } else {
      _userWantsListening = true;
      _baseAnswer = state.currentAnswer.trim();
      _currentUtterance = '';
      await _startListening();
    }
  }

  void updateAnswer(String text) {
    _baseAnswer = text.trim();
    _currentUtterance = '';
    emit(state.copyWith(currentAnswer: text));
  }

  void toggleInputMode() =>
      emit(state.copyWith(isVoiceMode: !state.isVoiceMode));

  void submitAnswer() {
    _userWantsListening = false;
    _restartTimer?.cancel();
    if (state.isListening) _speechToText.stop();
    if (state.isSpeaking) _flutterTts.stop();
    _commitCurrentUtterance();
    _saveAnswer(state.currentAnswer);
  }

  void skipQuestion() {
    _userWantsListening = false;
    _restartTimer?.cancel();
    if (state.isListening) _speechToText.stop();
    if (state.isSpeaking) _flutterTts.stop();
    _baseAnswer = '';
    _currentUtterance = '';
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
    _userWantsListening = false;
    _restartTimer?.cancel();
    _baseAnswer = '';
    _currentUtterance = '';
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
    _userWantsListening = false;
    _restartTimer?.cancel();
    await _flutterTts.stop();
    await _speechToText.stop();
    return super.close();
  }
}
