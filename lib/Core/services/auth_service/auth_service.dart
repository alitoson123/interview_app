import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final firebaseAuthInstance = FirebaseAuth.instance;
  static const String _webClientId =
      '594883657251-8pf26ftld7rvp561ifb1238l29va5llg.apps.googleusercontent.com';
  final GoogleSignIn _googleSignIn = GoogleSignIn(serverClientId: _webClientId);

  User? get user => firebaseAuthInstance.currentUser;

  Stream<User?> get authStateChanges => firebaseAuthInstance.userChanges();

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
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

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
    await _googleSignIn.signOut();
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

  List<String> getSignInProviders() {
    return firebaseAuthInstance.currentUser?.providerData
            .map((p) => p.providerId)
            .toList() ??
        [];
  }

  Future<void> reauthenticateWithPassword(String password) async {
    final currentUser = firebaseAuthInstance.currentUser;
    if (currentUser == null || currentUser.email == null) {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No user is currently signed in.',
      );
    }
    final credential = EmailAuthProvider.credential(
      email: currentUser.email!,
      password: password,
    );
    await currentUser.reauthenticateWithCredential(credential);
  }

  Future<void> reauthenticateWithGoogle() async {
    final currentUser = firebaseAuthInstance.currentUser;
    if (currentUser == null) {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No user is currently signed in.',
      );
    }
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'canceled',
        message: 'Re-authentication was canceled.',
      );
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await currentUser.reauthenticateWithCredential(credential);
  }

  Future<void> reauthenticateWithApple() async {
    final currentUser = firebaseAuthInstance.currentUser;
    if (currentUser == null) {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No user is currently signed in.',
      );
    }
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );
    await currentUser.reauthenticateWithCredential(credential);
  }

  bool isUserLoggedIn() {
    return firebaseAuthInstance.currentUser?.emailVerified ?? false;
  }
}
