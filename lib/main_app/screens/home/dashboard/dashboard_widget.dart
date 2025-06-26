import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_resources.dart';
import '../../../reusables/app_text.dart';
import '../../../reusables/colors.dart';
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
            child: Opacity(opacity: 0.6, child: Image.asset(AssetResources.glassPopUp, height: size.height * 0.55)),
          ),

          Positioned(top: 16, left: 10, child: SvgPicture.asset(AssetResources.twinkleStar, height: 65)),
          Positioned(top: 0, child: SvgPicture.asset(AssetResources.twinkleStar, height: 85)),
          Positioned(top: 16, right: 10, child: SvgPicture.asset(AssetResources.twinkleStar, height: 65)),
          Positioned(
            bottom: 80,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 100,
              height: 40,
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
                    SvgPicture.asset(AssetResources.coin),
                    AppText(text: "100", fontSize: 18, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
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

    return Container(
      width: size.width * 0.25,
      height: size.height * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: brown,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                color: red,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Row(
                children: [const AppText(text: "LEADERBOARD", fontWeight: FontWeight.bold, fontSize: 16)],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: goldGradientCard3,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                ),

                child: Container(
                  width: size.width * 0.23,

                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(gradient: goldGradientCard, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Card(
                        color: yellowLight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                          child: AppText(text: "PLAYERS", fontWeight: FontWeight.bold, color: green),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: size.width * 0.2,
                              child: Card(
                                color: creamClr,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                                  child: AppText(text: "Player 1", fontWeight: FontWeight.bold, color: brown),
                                ),
                              ),
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
