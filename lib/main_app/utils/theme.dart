import 'package:flutter/material.dart';

import '../reusables/colors.dart';

ThemeData getAppTheme(BuildContext context, {String? fontFamily}) {
  final ThemeData darkTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(backgroundColor: white),
    iconTheme: IconThemeData(color: white),
    listTileTheme: ListTileThemeData(iconColor: grey, tileColor: black),
    scaffoldBackgroundColor: black,
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(color: white),
      bodySmall: TextStyle(color: white),
      bodyMedium: TextStyle(color: white),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: white),

    drawerTheme: DrawerThemeData(backgroundColor: black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: black),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: black,
      iconTheme: IconThemeData(color: white),
      titleTextStyle: TextStyle(color: white),
    ),
    sliderTheme: SliderTheme.of(context).copyWith(thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
  );
  return darkTheme;
}
