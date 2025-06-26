import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class HomeAnimationController extends GetxController {
  final RxDouble animationValue = 1.3.obs;
  Timer? _timer;
  final Rxn<int> selectedIndex = Rxn<int>();

  void selectAvatar(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() {
    const frameRate = Duration(milliseconds: 16);
    const animationDuration = Duration(seconds: 14);
    final totalFrames = animationDuration.inMilliseconds ~/ frameRate.inMilliseconds;

    int frame = 0;
    _timer = Timer.periodic(frameRate, (_) {
      final t = (frame % totalFrames) / totalFrames;
      final scale = 1.15 + 0.15 * sin(2 * pi * t);
      animationValue.value = scale;
      frame++;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
