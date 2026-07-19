import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interview_app/Core/helpers/easy_loading_config.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_theme.dart';
import 'package:interview_app/Features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  EasyLoadingConfig.init();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  SingInCubit(signInRepoImpl: getIt<SignInRepoImpl>()),
            ),
          ],

          child: MaterialApp.router(
            builder: EasyLoading.init(), // <-- السطر المهم ده
           
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRoutes.route,
          ),
        );
      },
    );
  }
}
