import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuthInstance = FirebaseAuth.instance;

  Future<User> signUp({required String email, required String password}) async {
    var result = await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user!;
  }

  Future<User> signIn({required String email, required String password}) async {
    var result = await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user!;
  }

  Future<void> forgetpassword({required String email}) async {
    await firebaseAuthInstance.sendPasswordResetEmail(email: email);
  }
}
