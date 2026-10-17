import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/profile/domain/models/profile_stats_model.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUserProfile();
  Future<ProfileStatsModel> getProfileStats();
  Future<void> signOut();
  Future<void> deleteAccount();
  List<String> getAuthProviders();
  Future<void> reauthenticateWithPassword(String password);
  Future<void> reauthenticateWithGoogle();
  Future<void> reauthenticateWithApple();
}
