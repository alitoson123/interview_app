import 'package:dartz/dartz.dart';
import 'package:interview_app/Core/errors/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, void>> forgetPasswordMethod({required String email});
}
