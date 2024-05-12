import 'package:app/data/respositories/repositories.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  // Repositiries
  final firebaseRepo = FirebaseRepositoryApp();

  // always call method [ensureInitialized] first
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseRepo.initConfigProject();
  // Get current enviroment
  const String appFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR');
  final AppEnviroment currentEnv = AppEnviroment.values.firstWhere(
    (element) => appFlavor == element.name,
    orElse: () => AppEnviroment.dev,
  );
  // set base url with specified env
  AppFlavorsUtils.baseUrl = currentEnv.getCurrentBaseUrl;

  // init config loading
  configLoading();

  // main run app
  runApp(const ProviderScope(child: MyApp()));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: Routers.routers,
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: AppTheme.lightTheme,
          builder: EasyLoading.init(),
        );
      },
      child: const AuthScreen(),
    );
  }
}
