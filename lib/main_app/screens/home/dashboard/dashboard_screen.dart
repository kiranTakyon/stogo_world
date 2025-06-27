import 'package:flutter/foundation.dart';
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

        return SafeArea(
          child: Stack(
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
              Padding(
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
                    if (kIsWeb) sh200,
                    Padding(
                      padding: const EdgeInsets.only(right: kIsWeb ? 45 : 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Coupon(), GlassMissionCard(), sw5, LeaderboardCard()],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF7616ba), Color(0xFFe014dd)],
          stops: [0.0, 1.0],
        ),
      ),
      width: size.width * 0.34,
      height: kIsWeb ? size.height * 0.3 : size.height * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sw5,
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFb50ec4), Color(0xFF820cb0)],
                stops: [0.0, 1.0],
              ),
            ),
            width: size.width * 0.3,
            height: kIsWeb ? size.height * 0.28 : size.height * 0.32,
          ),
        ],
      ),
    );
  }
}
