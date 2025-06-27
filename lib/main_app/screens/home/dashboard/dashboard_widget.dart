import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/asset_resources.dart';
import '../../../reusables/app_text.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/custom_svg_icon.dart';
import '../../../services/app_services.dart';

class GlassMissionCard extends StatelessWidget {
  const GlassMissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Opacity(opacity: 0.6, child: Image.asset(AssetResources.glassPopUp, height: size.height * 0.45)),
          ),

          Positioned(
            top: kIsWeb ? 80 : 16,
            left: kIsWeb ? 90 : 10,
            child: CustomSvgIcon(iconPath: AssetResources.twinkleStarIcon, size: kIsWeb ? 60 : 48),
          ),
          Positioned(
            top: kIsWeb ? 60 : 0,
            child: CustomSvgIcon(iconPath: AssetResources.twinkleStarIcon, size: kIsWeb ? 80 : 65),
          ),
          Positioned(
            top: kIsWeb ? 80 : 16,
            right: kIsWeb ? 90 : 10,
            child: CustomSvgIcon(iconPath: AssetResources.twinkleStarIcon, size: kIsWeb ? 60 : 48),
          ),

          Positioned(
            bottom: kIsWeb ? 140 : 60,
            child: Column(
              spacing: 10,
              children: [
                AppText(
                  fontSize: 20,
                  text: "Mission 1",
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConstants.supermercadoOne,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 36,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(150, 0, 37, 174), Color.fromARGB(130, 0, 140, 202)],
                    ),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSvgIcon(iconPath: AssetResources.coinIcon),
                        AppText(text: "100", fontSize: 18, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kIsWeb ? 34 : -30,
            child: GestureDetector(
              onTap: () async {
                await AppServices.playSoundEffect();
              },
              child: Image.asset(AssetResources.goldenBtn, width: 130),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.24,
      height: size.height * 0.4,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 30,
            child: Container(
              width: size.width * 0.3,
              height: kIsWeb ? size.height * 0.25 : size.height * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF112f69), Color(0xFF1a6699), Color(0xFF0c295c)],
                  stops: [0.0, 0.6, 1.0],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(4, 6))],
              ),
            ),
          ),

          Positioned(
            top: kIsWeb ? -30 : -5,
            child: SizedBox(
              width: size.width * 0.3,
              child: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        final bool isCenter = index == 1;
                        final double avatarSize = isCenter ? (kIsWeb ? 60 : 40) : (kIsWeb ? 40 : 30);
                        return Column(
                          spacing: 5,
                          children: [
                            CircleAvatar(
                              radius: avatarSize,
                              backgroundColor: creamClr,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: avatarSize - 2,
                                  backgroundImage: AssetImage('assets/images/avatar${index + 1}.png'),
                                ),
                              ),
                            ),
                            AppText(text: "Name", fontSize: 13, fontWeight: FontWeight.bold),
                            AppText(text: "Mission 2", fontSize: 10),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: kIsWeb ? -105 : -55,
            child: CustomSvgIcon(iconPath: AssetResources.crown, size: kIsWeb ? 100 : 70),
          ),
        ],
      ),
    );
  }
}
