import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/auth_service/auth_service.dart';
import 'package:interview_app/Core/services/database_service/firestore_service.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignUpRemoteDataSource {
  final AuthService authService;
  final FirestoreService firestoreService;

  SignUpRemoteDataSource({
    required this.authService,
    required this.firestoreService,
  });

  Future<UserModel> signupMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await authService.signUp(email: email, password: password);

    await result.updateDisplayName(name);

    UserModel user = UserModel.fromFirebase(user: result, nameOverride: name);

    await firestoreService.setDocument(
      collection: AppConstant.usersCollection,
      docId: user.uid,
      data: user.toMap(),
    );

    return user;
  }

  Future<void> sendVerificationEmail() async {
    await authService.sendVerificationEmail();
  }
}
