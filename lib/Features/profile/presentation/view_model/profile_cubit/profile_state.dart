import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/profile/domain/models/profile_stats_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel? user;
  final ProfileStatsModel stats;

  ProfileLoaded({required this.user, required this.stats});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

class ProfileLoggedOut extends ProfileState {}
