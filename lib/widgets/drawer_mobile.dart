import 'package:flutter/material.dart';
import 'package:my_portfolio/controllers/home_controller.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: HeightSizeManager.h20,
                  bottom: HeightSizeManager.h20,
                  left: WidthSizeManager.w20),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < HomeController.navBarIconButton.length; i++)
            ListTile(
              key: UniqueKey(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: WidthSizeManager.w30),
              titleTextStyle: const TextStyle(
                  fontSize: FontSizeManager.f16,
                  color: AppColor.whitePrimary,
                  fontWeight: FontWeight.w600),
              leading: Icon(HomeController.navBarIconButton[i]),
              onTap: () {
                onNavItemTap(i);
              },
              title: Text(
                HomeController.navBarTextButtons[i],
              ),
            )
        ],
      ),
    );
  }
}
