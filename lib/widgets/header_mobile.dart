import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/core/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  final Function() onLogoTap;
  final Function() onMenuTap;
  const HeaderMobile({
    super.key,
    required this.onLogoTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightSizeManager.h50,
      margin: const EdgeInsets.fromLTRB(WidthSizeManager.w40,
          HeightSizeManager.h5, WidthSizeManager.w20, HeightSizeManager.h5),
      decoration: Style.kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          const SizedBox(width: WidthSizeManager.w15)
        ],
      ),
    );
  }
}
