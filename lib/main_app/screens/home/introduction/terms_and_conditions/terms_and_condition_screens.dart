import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_resources.dart';
import '../../../../reusables/animated_text.dart';
import '../../../../reusables/buttons.dart';
import '../../../../reusables/colors.dart';
import '../../../../reusables/sized_box.dart';
import '../../../../routes/app_reoutes.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = getScreenSize(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AssetResources.termsAndConditionsBg, fit: BoxFit.cover)),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TypewriterText(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            text: "Terms and Conditions",
                            key: ValueKey("Terms_and_conditions_title"),
                          ),
                          sh20,
                          TypewriterText(
                            fontSize: 14,
                            duration: Duration(milliseconds: 20),
                            key: ValueKey("Terms_and_conditions"),
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: CustomTextButton(
              title: "Next",
              onPressed: () async {
                Get.toNamed(AppRoutes.selectAvatarScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
