import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/cubits/app_config_cubit/app_config_state.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  final GeneralLocalService generalLocalService;

  AppConfigCubit({required this.generalLocalService})
      : super(AppConfigState.initial());

  Future<void> initConfig() async {
    final savedTheme = await generalLocalService.get<String>(
      AppConstant.settingsBox,
      AppConstant.themeModeKey,
    );
    final savedLocale = await generalLocalService.get<String>(
      AppConstant.settingsBox,
      AppConstant.localeKey,
    );

    final themeMode = _parseThemeMode(savedTheme);
    final locale = Locale(savedLocale == 'ar' ? 'ar' : 'en');

    emit(AppConfigState(themeMode: themeMode, locale: locale));
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    await generalLocalService.put<String>(
      AppConstant.settingsBox,
      AppConstant.themeModeKey,
      mode.name,
    );
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> changeLocale(Locale locale) async {
    await generalLocalService.put<String>(
      AppConstant.settingsBox,
      AppConstant.localeKey,
      locale.languageCode,
    );
    emit(state.copyWith(locale: locale));
  }

  ThemeMode _parseThemeMode(String? theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
