import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_app/main_app.dart';
import 'main_app/routes/app_reoutes.dart';

//Line length 120
//Flutter sdk used to develop 3.29.3 🍃
//This project follows MVVM architecture 😃 make sure to follow the standard.💡

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);

        final exceptionMessage = details.exceptionAsString();
        if (exceptionMessage.contains('RenderFlex overflowed')) {
          if (kDebugMode) {
            log('Layout warning (overflow) ignored: $exceptionMessage');
          }
          return;
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigatorKey.currentState?.pushNamed(AppRoutes.errorScreen, arguments: details);
        });
      };

      runApp(const MainApp());
    },
    (error, stackTrace) {
      final isOverflow = error.toString().contains('RenderFlex overflowed');
      if (!isOverflow) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigatorKey.currentState?.pushNamed(
            AppRoutes.errorScreen,
            arguments: FlutterErrorDetails(exception: error, stack: stackTrace),
          );
        });
      } else {
        if (kDebugMode) {
          log('Caught non-critical error (overflow) in runZonedGuarded: $error');
        }
      }
    },
  );
}
