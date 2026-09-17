
class ProfileStatsModel {
  final int totalInterviews;
  final int averageScore;
  final String favoriteTrack;

  const ProfileStatsModel({
    required this.totalInterviews,
    required this.averageScore,
    required this.favoriteTrack,
  });

  factory ProfileStatsModel.initial() {
    return const ProfileStatsModel(
      totalInterviews: 0,
      averageScore: 0,
      favoriteTrack: 'N/A',
    );
  }
}
