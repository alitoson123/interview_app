//import 'package:dio/dio.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Core/services/interview_service/history_service.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:interview_app/Features/auth/forget_password/data/repo_impl/forget_password_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_app/Core/services/interview_service/interview_service.dart';
import 'package:interview_app/Features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_local_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/data_source.dart/interview_remote_data_source.dart';
import 'package:interview_app/Features/interview_setup/data/repo_impl/interview_repo_impl.dart';

import 'package:interview_app/Features/history/data/data_source/history_local_data_source.dart';
import 'package:interview_app/Features/history/data/data_source/history_remote_data_source.dart';
import 'package:interview_app/Features/history/data/repo_impl/history_repo_impl.dart';

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
  getIt.registerLazySingleton<HistoryService>(() => HistoryService());

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

  //  Register Interview Feature dependencies
  getIt.registerLazySingleton<InterviewService>(
    () => InterviewService(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerLazySingleton<InterviewLocalDataSource>(
    () => InterviewLocalDataSource(
      generalLocalService: getIt<GeneralLocalService>(),
    ),
  );
  getIt.registerLazySingleton<InterviewRemoteDataSource>(
    () => InterviewRemoteDataSource(
      interviewService: getIt<InterviewService>(),
    ),
  );
  getIt.registerLazySingleton<InterviewRepoImpl>(
    () => InterviewRepoImpl(
      interviewRemoteDataSource: getIt<InterviewRemoteDataSource>(),
      interviewLocalDataSource: getIt<InterviewLocalDataSource>(),
    ),
  );

  // Register History Feature dependencies
  getIt.registerLazySingleton<HistoryRemoteDataSource>(
    () => HistoryRemoteDataSource(
      historyService: getIt<HistoryService>(),
    ),
  );
  getIt.registerLazySingleton<HistoryLocalDataSource>(
    () => HistoryLocalDataSource(
      generalLocalService: getIt<GeneralLocalService>(),
    ),
  );
  getIt.registerLazySingleton<HistoryRepoImpl>(
    () => HistoryRepoImpl(
      historyRemoteDataSource: getIt<HistoryRemoteDataSource>(),
      historyLocalDataSource: getIt<HistoryLocalDataSource>(),
    ),
  );
}

