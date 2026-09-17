import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Features/profile/domain/repo/profile_repo.dart';
import 'package:interview_app/Features/profile/presentation/view_model/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getUserProfile();
      final stats = await profileRepo.getProfileStats();
      emit(ProfileLoaded(user: user, stats: stats));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await profileRepo.signOut();
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    try {
      await profileRepo.deleteAccount();
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
