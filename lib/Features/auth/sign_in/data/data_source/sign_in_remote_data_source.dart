import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/database_service/database_service.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignInRemoteDataSource {
  final AuthService authService;
  final DatabaseService firestoreService;

  SignInRemoteDataSource({
    required this.authService,
    required this.firestoreService,
  });

  Future<UserModel> signInMethod({
    required String email,
    required String password,
  }) async {
    final result = await authService.signIn(email: email, password: password);

    UserModel user = UserModel.fromFirebase(user: result);

    return user;
  }

  Future<UserModel?> signInWithGoogleMethod() async {
    final result = await authService.signInWithGoogle();
    if (result == null) {
      return null;
    }
    UserModel user = UserModel.fromFirebase(user: result);

    final isUserExists = await firestoreService.documentExists(
      collection: AppConstant.usersCollection,
      docId: user.uid,
    );
    if (!isUserExists) {
      await firestoreService.setDocument(
        collection: AppConstant.usersCollection,
        docId: user.uid,
        data: user.toMap(),
      );
    }
    return user;
  }

  Future<UserModel?> signInWithAppleMethod() async {
    final result = await authService.signInWithApple();
    if (result == null) {
      return null;
    }
    UserModel user = UserModel.fromFirebase(user: result);

    final isUserExists = await firestoreService.documentExists(
      collection: AppConstant.usersCollection,
      docId: user.uid,
    );
    if (!isUserExists) {
      await firestoreService.setDocument(
        collection: AppConstant.usersCollection,
        docId: user.uid,
        data: user.toMap(),
      );
    }
    return user;
  }
}
