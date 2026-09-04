//import 'package:dio/dio.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:interview_app/Features/auth/forget_password/data/repo_impl/forget_password_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_app/Features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart';

final getIt = GetIt.instance; // Service locator

void setup() {
  // 1. Register AppServices first
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<GeneralLocalService>(() => GeneralLocalService());
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(
      generalLocalService: getIt<GeneralLocalService>(),
    ),
  );

  //  Register SignIn Feature dependencies
  getIt.registerLazySingleton<SignInRepoImpl>(
    () => SignInRepoImpl(
      signInRemoteDataSource: SignInRemoteDataSource(
        authService: getIt<AuthService>(),
        firestoreService: getIt<DatabaseService>(),
      ),
      authLocalDataSource: AuthLocalDataSource(
        generalLocalService: getIt<GeneralLocalService>(),
      ),
    ),
  );
  //  Register SignUp Feature dependencies
  getIt.registerLazySingleton<SignUpRepoImpl>(
    () => SignUpRepoImpl(
      signUpRemoteDataSource: SignUpRemoteDataSource(
        authService: getIt<AuthService>(),
        firestoreService: getIt<DatabaseService>(),
      ),
      authLocalDataSource: AuthLocalDataSource(
        generalLocalService: getIt<GeneralLocalService>(),
      ),
    ),
  );

  //  Register ForgetPassword Feature dependencies
  getIt.registerLazySingleton<ForgetPasswordRepoImpl>(
    () => ForgetPasswordRepoImpl(
      forgetPasswordRemoteDataSource: ForgetPasswordRemoteDataSource(
        authService: getIt<AuthService>(),
      ),
    ),
  );
}
