import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/history/data/data_source/history_local_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/profile/domain/models/profile_stats_model.dart';
import 'package:interview_app/Features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final AuthService authService;
  final AuthLocalDataSource authLocalDataSource;
  final HistoryLocalDataSource historyLocalDataSource;

  ProfileRepoImpl({
    required this.authService,
    required this.authLocalDataSource,
    required this.historyLocalDataSource,
  });

  @override
  Future<UserModel?> getUserProfile() async {
    final localUser = await authLocalDataSource.getUser();
    if (localUser != null) return localUser;

    final firebaseUser = authService.user;
    if (firebaseUser != null) {
      return UserModel.fromFirebase(user: firebaseUser);
    }
    return null;
  }

  @override
  Future<ProfileStatsModel> getProfileStats() async {
    final sessions = await historyLocalDataSource.getInterviewsHistory();
    final totalInterviews = sessions.length;

    final favoriteTrack = _computeFavoriteTrack(sessions);
    final averageScore = _computeAverageScore(sessions);

    return ProfileStatsModel(
      totalInterviews: totalInterviews,
      averageScore: averageScore,
      favoriteTrack: favoriteTrack,
    );
  }

  String _computeFavoriteTrack(List<InterviewSessionModel> sessions) {
    if (sessions.isEmpty) return ' ';
    final countMap = <String, int>{};
    for (final session in sessions) {
      final track = session.config.track;
      if (track.isNotEmpty) {
        countMap[track] = (countMap[track] ?? 0) + 1;
      }
    }
    if (countMap.isEmpty) return ' ';
    return countMap.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
  }

  int _computeAverageScore(List<InterviewSessionModel> sessions) {
    if (sessions.isEmpty) return 0;
    int totalQuestions = 0;
    int answeredQuestions = 0;

    for (final session in sessions) {
      totalQuestions += session.questions.length;
      answeredQuestions += session.questions.where((q) {
        final answer = q.userAnswer?.trim();
        return answer != null && answer.isNotEmpty;
      }).length;
    }

    if (totalQuestions == 0) return 0;
    return ((answeredQuestions / totalQuestions) * 100).round();
  }

  @override
  Future<void> signOut() async {
    await authLocalDataSource.deleteUser();
    await authService.signOutMethod();
  }

  @override
  Future<void> deleteAccount() async {
    await authLocalDataSource.deleteUser();
    await authService.deleteAccountMethod();
  }
}
