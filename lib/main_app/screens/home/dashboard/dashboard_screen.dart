import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/asset_resources.dart';
import '../../../controller/select_avatar_controller.dart';
import '../../../reusables/app_text.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box.dart';
import 'dashboard_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectAvatarController animationController = Get.put(SelectAvatarController());

    return Scaffold(
      body: Obx(() {
        final double animationValue = animationController.animationValue.value;

        return Stack(
          fit: StackFit.expand,
          children: [
            Transform.scale(
              scale: animationValue,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(AssetResources.spaceShip, fit: BoxFit.cover),
                  Container(color: black.withAlpha((0.12 * 255).toInt())),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    sh10,
                    Row(
                      children: [
                        CircleAvatar(radius: 22, backgroundImage: AssetImage(AppConstants.avatarUrl)),
                        sw10,
                        AppText(
                          fontSize: 18,
                          text: "Welcome User",
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstants.supermercadoOne,
                        ),
                      ],
                    ),
                    sh5,
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LeaderboardCard(), GlassMissionCard(), LeaderboardCard()],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
