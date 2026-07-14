import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignUpRemoteDataSource {
  final AuthService authService;

  SignUpRemoteDataSource({required this.authService});

  Future<UserModel> signupMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await authService.signUp(email: email, password: password);

    await result.updateDisplayName(name);

    UserModel user = UserModel.fromFirebase(result);

    return user;
  }
}
