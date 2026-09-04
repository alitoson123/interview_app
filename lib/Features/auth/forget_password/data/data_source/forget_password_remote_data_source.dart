import 'package:interview_app/Core/services/auth_service/auth_service.dart';

class ForgetPasswordRemoteDataSource {
  final AuthService authService;

  ForgetPasswordRemoteDataSource({required this.authService});

  Future<void> forgetPasswordMethod({required String email}) async {
    await authService.forgetPassword(email: email);
  }
}
