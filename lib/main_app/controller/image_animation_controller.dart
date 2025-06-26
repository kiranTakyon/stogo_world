import 'package:get/get.dart';

class ImageAnimationController extends GetxController {
  final zoomInMap = <String, bool>{}.obs;

  void startAnimation(String imagePath) {
    if (!zoomInMap.containsKey(imagePath)) {
      zoomInMap[imagePath] = true;
    }

    Future.delayed(const Duration(seconds: 5), () {
      toggleZoom(imagePath);
    });
  }

  void toggleZoom(String imagePath) {
    if (zoomInMap.containsKey(imagePath)) {
      zoomInMap[imagePath] = !(zoomInMap[imagePath]!);
      startAnimation(imagePath); // Loop animation
    }
  }

  bool isZoomIn(String imagePath) {
    return zoomInMap[imagePath] ?? true;
  }
}
