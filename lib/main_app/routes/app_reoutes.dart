import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/introduction_binding.dart';
import '../screens/home/error_screen/error_screen.dart';
import '../screens/home/introduction/introduction_screen.dart';
import '../screens/home/introduction/terms_and_conditions/terms_and_condition_screens.dart';
import '../screens/home/select_avatar/select_avatar_screen.dart';

class AppRoutes {
  static const String home = "/home";
  static const String errorScreen = "/errorScreen";
  static const String selectAvatarScreen = "/selectAvatarScreen";
  static const String introductionScreen = "/introductionScreen";
  static const String termsAndConditionScreen = "/termsAndConditionScreen";

  static List<GetPage> pages = [
    GetPage(name: errorScreen, page: () => ErrorScreen()),
    GetPage(name: selectAvatarScreen, page: () => SelectAvatarScreen()),
    GetPage(name: termsAndConditionScreen, page: () => TermsAndConditionScreen()),
    GetPage(name: introductionScreen, page: () => IntroductionScreen(), binding: IntroductionBinding()),
  ];
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
