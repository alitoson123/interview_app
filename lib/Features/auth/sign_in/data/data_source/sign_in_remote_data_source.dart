import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignInRemoteDataSource {
  final AuthService authService;

  SignInRemoteDataSource({required this.authService});

  Future<UserModel> signinMethod({
    required String email,
    required String password,
  }) async {
    final result = await authService.signIn(email: email, password: password);

    UserModel user = UserModel.fromFirebase(result);

    return user;
  }
}
