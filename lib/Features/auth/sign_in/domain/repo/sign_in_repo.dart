import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

abstract class SignInRepo {
  Future<Either<Failure, UserModel>> signInMethod({
    required String email,
    required String password,
  });
}
