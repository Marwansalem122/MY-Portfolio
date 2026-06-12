import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/config/size_config.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.onTab});
  final Function(int) onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: WidthSizeManager.w20,
        ),
        constraints: const BoxConstraints(minHeight: HeightSizeManager.h350),
        height: SizeConfig.screenHeight! / HeightSizeManager.h1f2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(StringsManager.introduceMySelf,
                        textStyle: const TextStyle(
                            fontSize: FontSizeManager.f30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.whitePrimary,
                            height: 1.5),
                        speed: const Duration(milliseconds: 150)),
                  ],
                ),
                const SizedBox(height: HeightSizeManager.h20),
                SizedBox(
                  width: WidthSizeManager.w250,
                  height: HeightSizeManager.h40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.yellowPrimary),
                      onPressed: () {
                        onTab(3); // Replace with your tab index when implementing tabs.
                      },
                      child: const Text(StringsManager.getInTouch,
                          style: TextStyle(
                              color: AppColor.whitePrimary,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
            CircleAvatar(
              radius: SizeConfig.screenWidth! * WidthSizeManager.w163f9,
              backgroundImage: const AssetImage(
                AssetsManager.myImage,
              ),
            ),
          ],
        ));
  }
}
