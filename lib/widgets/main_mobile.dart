import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/config/size_config.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, required this.onTab});
  final Function(int) onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight,
        margin: const EdgeInsets.symmetric(
            vertical: HeightSizeManager.h30, horizontal: WidthSizeManager.w40),
        constraints: const BoxConstraints(minHeight: HeightSizeManager.h520),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(colors: [
                        AppColor.whitePrimary.withOpacity(0.6),
                        AppColor.whitePrimary.withOpacity(0.6)
                      ]).createShader(bounds);
                    },
                    blendMode: BlendMode.softLight,
                    child: Image.asset(
                      AssetsManager.myImage,
                      height: SizeConfig.screenHeight! / 3.75,
                    ),
                  )),
            ),
            const SizedBox(height: HeightSizeManager.h30),
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
              width: WidthSizeManager.w180,
              height: HeightSizeManager.h40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.yellowPrimary),
                  onPressed: () {
                    onTab(3);
                  },
                  child: const Text(StringsManager.getInTouch,
                      style: TextStyle(
                          color: AppColor.whitePrimary,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}
