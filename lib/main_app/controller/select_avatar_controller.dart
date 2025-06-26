import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/app_constants.dart';
import '../constants/app_lists.dart';
import '../routes/app_routes.dart';

class SelectAvatarController extends GetxController {
  Timer? timer;
  final RxDouble animationValue = 1.3.obs;
  final Rxn<int> selectedIndex = Rxn<int>();

  final box = GetStorage();

  void selectAvatar(int index) {
    selectedIndex.value = index;

    final path = avatars[index];
    AppConstants.avatarUrl = path;
    box.write('selected_avatar', path);
    Get.toNamed(AppRoutes.dashboardScreen);
  }

  @override
  void onInit() {
    super.onInit();
    startAnimation();

    final storedPath = box.read('selected_avatar');
    if (storedPath != null && avatars.contains(storedPath)) {
      AppConstants.avatarUrl = storedPath;
      selectedIndex.value = avatars.indexOf(storedPath);
    }
  }

  void startAnimation() {
    const frameRate = Duration(milliseconds: 16);
    const animationDuration = Duration(seconds: 14);
    final totalFrames = animationDuration.inMilliseconds ~/ frameRate.inMilliseconds;

    int frame = 0;
    timer = Timer.periodic(frameRate, (_) {
      final t = (frame % totalFrames) / totalFrames;
      final scale = 1.15 + 0.15 * sin(2 * pi * t);
      animationValue.value = scale;
      frame++;
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
