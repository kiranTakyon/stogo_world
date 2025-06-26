import 'dart:developer';

import 'package:get/get.dart';

import '../services/app_services.dart';

class IntroductionController extends GetxController {
  final RxInt currentIndex = 0.obs;
  RxInt totalSlides = 3.obs;

  void setTotalSlides(int value, List<String> images) {
    totalSlides = value.obs;
  }

  void nextSlide() {
    if (currentIndex.value < totalSlides.value - 1) {
      changeSlide(currentIndex.value + 1);
    }
  }

  void skipToLastSlide() {
    changeSlide(totalSlides.value - 1);
  }

  void changeSlide(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    playIntroMusicWithRetry();
  }

  void playIntroMusicWithRetry({int retryCount = 3}) async {
    int attempt = 0;
    bool played = false;

    while (attempt < retryCount && !played) {
      try {
        await AppServices.playBackgroundMusic();
        played = true;
      } catch (e) {
        attempt++;
        if (attempt < retryCount) {
          await Future.delayed(const Duration(seconds: 1));
        } else {
          log("🎵 Failed to play music after $retryCount attempts: $e");
        }
      }
    }
  }
}
