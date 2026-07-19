import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

abstract class SignUpRepo {
  
  Future<Either<Failure, UserModel>> signupMethod({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> sendVerificationEmail();
}
