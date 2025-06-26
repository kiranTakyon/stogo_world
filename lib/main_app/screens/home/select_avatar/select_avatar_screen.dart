import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/asset_resources.dart';
import '../../../controller/home_screen_controller.dart';
import '../../../reusables/app_text.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box.dart';
import '../../../services/app_services.dart';

class SelectAvatarScreen extends StatelessWidget {
  const SelectAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<String> avatars = [
      AssetResources.avatar1,
      AssetResources.avatar2,
      AssetResources.avatar3,
      AssetResources.avatar4,
      AssetResources.avatar5,
    ];

    final animationController = Get.put(HomeAnimationController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(() {
              final animationValue = animationController.animationValue.value;

              return Transform.scale(
                scale: animationValue,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(AssetResources.termsAndConditionsBg, fit: BoxFit.cover),
                    Container(color: black.withAlpha((0.12 * 255).toInt())),
                  ],
                ),
              );
            }),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.7,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: white.withAlpha(25),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: white.withAlpha(51)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          final selected = animationController.selectedIndex.value;
                          return Wrap(
                            spacing: 8,
                            children: List.generate(avatars.length, (index) {
                              final isSelected = selected == index;
                              return GestureDetector(
                                onTap: () async {
                                  animationController.selectAvatar(index);
                                  await AppServices.playSoundEffect();
                                },
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: isSelected ? green : transparent,
                                  child: CircleAvatar(radius: 24, backgroundImage: AssetImage(avatars[index])),
                                ),
                              );
                            }),
                          );
                        }),
                        sh20,
                        const AppText(text: "Hello User", fontSize: 20, fontWeight: FontWeight.bold),
                        const AppText(text: "Choose your Stogo Character", fontSize: 20, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
