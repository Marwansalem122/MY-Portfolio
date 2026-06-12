import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: HeightSizeManager.h20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(StringsManager.madeBy,
          style: TextStyle(
              fontWeight: FontWeight.w400, color: AppColor.whiteSecondary)),
    );
  }
}
