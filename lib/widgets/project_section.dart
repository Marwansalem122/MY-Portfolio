import 'package:flutter/material.dart';
import 'package:my_portfolio/core/config/size_config.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'package:my_portfolio/widgets/project_card_widget.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.fromLTRB(WidthSizeManager.w25,
            HeightSizeManager.h20, WidthSizeManager.w25, HeightSizeManager.h60),
        child: Column(
          children: [
            const Text(
              StringsManager.workProjects,
              style: TextStyle(
                  fontSize: FontSizeManager.f24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whitePrimary),
            ),
            const SizedBox(height: HeightSizeManager.h50),
            ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: WidthSizeManager.w900),
              child: Wrap(
                  spacing: WidthSizeManager.w25,
                  runSpacing: WidthSizeManager.w25,
                  children: [
                    for (int i = 0; i < hobbyProjectUtils.length; i++)
                      ProjectCardWidget(projectUtils: hobbyProjectUtils[i])
                  ]),
            )
          ],
        ));
  }
}
