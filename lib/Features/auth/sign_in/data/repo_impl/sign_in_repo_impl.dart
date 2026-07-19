import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_in/domain/repo/sign_in_repo.dart';

class SignInRepoImpl extends SignInRepo {
  final SignInRemoteDataSource signInRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SignInRepoImpl({
    required this.signInRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> signInMethod({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await signInRemoteDataSource.signinMethod(
        email: email,
        password: password,
      );
      await authLocalDataSource.initHive();
      await authLocalDataSource.saveUser(user: user);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


  Future<Either<Failure, UserModel>> signInWithGoogleMethod() async {
    try {
      UserModel user = await signInRemoteDataSource.signInWithGoogleMethod();
      await authLocalDataSource.initHive();
      await authLocalDataSource.saveUser(user: user);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> signInWithAppleMethod() async {
    try {
      UserModel user = await signInRemoteDataSource.signInWithAppleMethod();
      await authLocalDataSource.initHive();
      await authLocalDataSource.saveUser(user: user);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  
  


  

}
