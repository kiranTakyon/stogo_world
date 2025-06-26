import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants/app_lists.dart';
import '../../../controller/introduction_controller.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../routes/app_reoutes.dart';
import 'introduction_screen_widget.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    final PageController pageController = PageController();
    final IntroductionController introductionController = Get.put(IntroductionController());

    introductionController.setTotalSlides(introductionImages.length, introductionImages);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final image in introductionImages) {
        precacheImage(AssetImage(image), context);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: black,
            child: PageView.builder(
              controller: pageController,
              itemCount: introductionImages.length,
              onPageChanged: introductionController.changeSlide,
              itemBuilder: (context, index) {
                return IntroductionScreenWidget(
                  index: index,
                  pageController: pageController,
                  image: introductionImages[index],
                  title: introductionTitles[index],
                  subtitle: introductionSubTitles[index],
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: Obx(() {
              final isLast = introductionController.currentIndex.value == introductionController.totalSlides.value - 1;

              return CustomTextButton(
                title: isLast ? "Continue" : "Next",
                onPressed: () async {
                  if (!isLast) {
                    await pageController.nextPage(
                      curve: Curves.easeOutExpo,
                      duration: const Duration(milliseconds: 500),
                    );
                  } else {
                    Get.toNamed(AppRoutes.termsAndConditionScreen);
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
