import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interview_app/Core/theme/app_color.dart';

class EasyLoadingConfig {
  static void init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 12.0
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primary
      ..textColor = Colors.black87
      ..maskColor = Colors.black.withOpacity(0.4)
      ..userInteractions =
          false // ده اللي بيمنع اللمس فعليًا
      ..dismissOnTap = false;
  }
}
