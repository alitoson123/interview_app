import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';
import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class AuthLocalDataSource {
  final GeneralLocalService generalLocalService;

  AuthLocalDataSource({required this.generalLocalService});

  static bool _isInitialized = false;

   Future<void> initHive() async {
    if (_isInitialized) return;
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());

    await Hive.openBox<UserModel>(AppConstant.userBox);
    _isInitialized = true;
  }

  Future<void> saveUser({required UserModel user}) async {
    await generalLocalService.put<UserModel>(
      AppConstant.userBox,
      AppConstant.currentUserKey,
      user,
    );
  }

  Future<UserModel?> getUser() async {
    return await generalLocalService.get<UserModel>(
      AppConstant.userBox,
      AppConstant.currentUserKey,
    );
  }

  Future<void> deleteUser() async {
    await generalLocalService.clearBox<UserModel>(AppConstant.userBox);
  }
}
