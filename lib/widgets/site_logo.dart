import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';

class SiteLogo extends StatelessWidget {
  final Function()? onTap;
  const SiteLogo({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(StringsManager.myIcon,
          style: TextStyle(
              fontSize: FontSizeManager.f25,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: AppColor.yellowSecondary)),
    );
  }
}
