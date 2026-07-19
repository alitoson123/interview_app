import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/core/data/data_source/auth_local_data_source.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';
import 'package:interview_app/Features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:interview_app/Features/auth/sign_up/domain/repo/sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  final SignUpRemoteDataSource signUpRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SignUpRepoImpl({
    required this.signUpRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> signupMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await signUpRemoteDataSource.signupMethod(
        name: name,
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

  @override
  Future<Either<Failure, void>> sendVerificationEmail() async {
    try {
      await signUpRemoteDataSource.sendVerificationEmail();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
