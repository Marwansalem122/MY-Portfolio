import 'package:flutter/material.dart';
import 'package:my_portfolio/controllers/home_controller.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/core/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDeasktop extends StatelessWidget {
  const HeaderDeasktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightSizeManager.h60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
          vertical: HeightSizeManager.h10, horizontal: WidthSizeManager.w20),
      decoration: Style.kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () {}),
          const Spacer(),
          for (int i = 0; i < HomeController.navBarTextButtons.length; i++)
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: Text(HomeController.navBarTextButtons[i],
                      style: const TextStyle(
                          fontSize: FontSizeManager.f16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whitePrimary)),
                ))
        ],
      ),
    );
  }
}
