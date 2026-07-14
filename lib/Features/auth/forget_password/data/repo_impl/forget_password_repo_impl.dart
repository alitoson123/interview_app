import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:interview_app/Features/auth/forget_password/domain/repo/forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordRepoImpl({required this.forgetPasswordRemoteDataSource});

  @override
  Future<Either<Failure, void>> forgetPasswordMethod({
    required String email,
  }) async {
    try {
      await forgetPasswordRemoteDataSource.forgetpasswordMethod(email: email);

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
