import 'package:flutter/material.dart';
import 'package:my_portfolio/controllers/home_controller.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: WidthSizeManager.w500),
      child: Column(
        children: [
          //Platform
          for (int i = 0; i < HomeController.platFormItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: HeightSizeManager.h5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColor.bgLight2,
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: HeightSizeManager.h10,
                    horizontal: WidthSizeManager.w20),
                leading: Image.asset(HomeController.platFormItems[i]["img"],
                    width: WidthSizeManager.w26),
                title: Text(HomeController.platFormItems[i]["title"]),
              ),
            ),
          const SizedBox(height: HeightSizeManager.h50),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              for (int i = 0; i < HomeController.mySkills.length; i++)
                Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: AppColor.bgLight2,
                  padding: const EdgeInsets.symmetric(
                    vertical: HeightSizeManager.h12,
                    horizontal: WidthSizeManager.w16,
                  ),
                  label: Text(HomeController.mySkills[i]["title"]),
                  avatar: Image.asset(HomeController.mySkills[i]["img"]),
                )
            ],
          )
        ],
      ),
    );
  }
}
