import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stogo_play/main_app/utils/theme.dart';

import 'constants/app_constants.dart';
import 'reusables/colors.dart';
import 'routes/app_reoutes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // setupDio();

    return GetMaterialApp(
      enableLog: true,
      locale: Locale("en"),
      getPages: AppRoutes.pages,
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.system,
      title: AppConstants.appTitle,
      theme: getAppTheme(context),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialRoute: AppRoutes.introductionScreen,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: transparent,
            systemNavigationBarColor: black,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: child!,
        );
      },
    );
  }

  // void setupDio() {
  //   BaseOptions baseOptions = BaseOptions(baseUrl: UrlResources.baseUrl, connectTimeout: const Duration(seconds: 30));
  //   dio = Dio(baseOptions)..interceptors.add(dioLoggerInterceptor);
  // }
}
