import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final firebaseAuthInstance = FirebaseAuth.instance;

  User? get user => firebaseAuthInstance.currentUser;

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

  Future<void> forgetPassword({required String email}) async {
    await firebaseAuthInstance.sendPasswordResetEmail(email: email);
  }

  Future<User?> signInWithGoogle() async {
    // Trigger Google Sign-In flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the user cancels sign-in
    if (googleUser == null) return null;

    // Obtain authentication details
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential,
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Firebase
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);

    final User? user = userCredential.user;

    return user;
  }

  Future<User?> signInWithApple() async {
    final AuthorizationCredentialAppleID appleIdCredential =
        await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

    final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
    final AuthCredential credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);

    final User? user = userCredential.user;

    return user;
  }

  Future<void> signOutMethod() async {
    await GoogleSignIn().signOut();
    await firebaseAuthInstance.signOut();
  }

  Future<void> deleteAccountMethod() async {
    await firebaseAuthInstance.currentUser?.delete();
  }

  Future<void> sendVerificationEmail() async {
    await firebaseAuthInstance.currentUser?.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    await firebaseAuthInstance.currentUser?.reload();
    return firebaseAuthInstance.currentUser?.emailVerified ?? false;
  }

  bool isUserLoggedIn() {
    return firebaseAuthInstance.currentUser?.emailVerified ?? false;
  }
}
