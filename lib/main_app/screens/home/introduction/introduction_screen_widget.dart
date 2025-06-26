import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/asset_resources.dart';
import '../../../controller/introduction_controller.dart';
import '../../../reusables/animated_text.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box.dart';
import '../../../services/app_services.dart';

class IntroductionScreenWidget extends StatelessWidget {
  final int index;
  final String title;
  final String image;
  final String subtitle;
  final PageController pageController;

  const IntroductionScreenWidget({
    super.key,
    required this.index,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final IntroductionController controller = Get.put(IntroductionController());
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height, // Or any fixed height
            child: Obx(() {
              final isActive = controller.currentIndex.value == index;
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: isActive ? 1.3 : 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(milliseconds: 300),
                      child: SizedBox.expand(child: Image.asset(image, fit: BoxFit.cover)),
                    ),
                  );
                },
              );
            }),
          ),
        ),

        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(AssetResources.introBg, fit: BoxFit.cover)),
              Positioned(
                bottom: size.height * 0.25,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: white.withAlpha(25),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: white.withAlpha(51)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            sh20,
                            TypewriterText(
                              key: ValueKey(title),
                              text: title,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            sh10,
                            SizedBox(
                              width: size.width * 0.3,
                              child: TypewriterText(key: ValueKey(subtitle), text: subtitle, fontSize: 14),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (dotIndex) => GestureDetector(
                                  onTap: () async {
                                    await AppServices.playSoundEffect();
                                    pageController.animateToPage(
                                      dotIndex,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == dotIndex ? white : grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            sh20,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
