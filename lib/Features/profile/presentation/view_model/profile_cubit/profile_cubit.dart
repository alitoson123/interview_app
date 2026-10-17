import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/profile/domain/models/profile_stats_model.dart';
import 'package:interview_app/Features/profile/domain/repo/profile_repo.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  UserModel? _cachedUser;
  ProfileStatsModel? _cachedStats;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getUserProfile();
      final stats = await profileRepo.getProfileStats();
      _cachedUser = user;
      _cachedStats = stats;
      if (isClosed) return;
      emit(ProfileLoaded(user: user, stats: stats));
    } catch (e) {
      if (isClosed) return;
      emit(ProfileError(message: e.toString()));
    }
  }

  void _restoreLoadedState() {
    if (_cachedStats != null) {
      emit(ProfileLoaded(user: _cachedUser, stats: _cachedStats!));
    }
  }

  Future<void> signOut() async {
    emit(ProfileActionLoading());
    try {
      await profileRepo.signOut();
      if (isClosed) return;
      emit(ProfileLoggedOut());
    } catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(message: e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(ProfileActionLoading());
    try {
      await profileRepo.deleteAccount();
      if (isClosed) return;
      emit(ProfileLoggedOut());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      if (e.code == 'requires-recent-login') {
        final providers = profileRepo.getAuthProviders();
        emit(ProfileRequiresReauth(providers: providers));
      } else {
        emit(ProfileActionError(
          message: ServerFailure.fromFirebaseAuthError(e).errorMessage,
        ));
      }
    } catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(message: e.toString()));
    }
  }

  Future<void> reauthenticateWithPasswordAndDelete(String password) async {
    emit(ProfileActionLoading());
    try {
      await profileRepo.reauthenticateWithPassword(password);
      await profileRepo.deleteAccount();
      if (isClosed) return;
      emit(ProfileLoggedOut());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(
        message: ServerFailure.fromFirebaseAuthError(e).errorMessage,
      ));
    } catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(message: e.toString()));
    }
  }

  Future<void> reauthenticateWithGoogleAndDelete() async {
    emit(ProfileActionLoading());
    try {
      await profileRepo.reauthenticateWithGoogle();
      await profileRepo.deleteAccount();
      if (isClosed) return;
      emit(ProfileLoggedOut());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      if (e.code != 'canceled') {
        emit(ProfileActionError(
          message: ServerFailure.fromFirebaseAuthError(e).errorMessage,
        ));
      }
    } catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(message: e.toString()));
    }
  }

  Future<void> reauthenticateWithAppleAndDelete() async {
    emit(ProfileActionLoading());
    try {
      await profileRepo.reauthenticateWithApple();
      await profileRepo.deleteAccount();
      if (isClosed) return;
      emit(ProfileLoggedOut());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(
        message: ServerFailure.fromFirebaseAuthError(e).errorMessage,
      ));
    } catch (e) {
      if (isClosed) return;
      _restoreLoadedState();
      emit(ProfileActionError(message: e.toString()));
    }
  }
}
