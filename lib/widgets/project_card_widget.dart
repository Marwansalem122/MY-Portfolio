import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils projectUtils;
  const ProjectCardWidget({super.key, required this.projectUtils});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod(
          'open',
          [projectUtils.androidLink, projectUtils.iosLink, projectUtils.webLink],
        );
      },
      child: Container(
          width: WidthSizeManager.w260,
          height: HeightSizeManager.h300,
          decoration: BoxDecoration(
            color: AppColor.bgLight2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(projectUtils.image,
                      fit: BoxFit.cover,
                      height: HeightSizeManager.h140,
                      width: WidthSizeManager.w260),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      WidthSizeManager.w12,
                      HeightSizeManager.h15,
                      WidthSizeManager.w12,
                      HeightSizeManager.h12),
                  child: Text(
                    projectUtils.title,
                    style: const TextStyle(
                        fontSize: FontSizeManager.f24,
                        color: AppColor.whitePrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      WidthSizeManager.w12,
                      HeightSizeManager.h0,
                      WidthSizeManager.w12,
                      HeightSizeManager.h12),
                  child: Text(
                    projectUtils.subTitle,
                    style: const TextStyle(
                        fontSize: FontSizeManager.f12,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteSecondary),
                  ),
                ),
                const Spacer(),
                Container(
                    color: AppColor.bgLight1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: WidthSizeManager.w12,
                        vertical: HeightSizeManager.h10),
                    child: Row(
                      children: [
                        const Text(
                          StringsManager.availableOn,
                          style: TextStyle(
                              fontSize: FontSizeManager.f10,
                              fontWeight: FontWeight.bold,
                              color: AppColor.yellowSecondary),
                        ),
                        const Spacer(),
                        (projectUtils.androidLink.isNotEmpty)
                            ? InkWell(
                                onTap: () {
                                  js.context.callMethod(
                                    'open',
                                    [projectUtils.androidLink],
                                  );
                                },
                                child: Image.asset(AssetsManager.androidImage,
                                    width: WidthSizeManager.w12),
                              )
                            : const SizedBox.shrink(),
                        (projectUtils.iosLink.isNotEmpty)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: WidthSizeManager.w6),
                                child: InkWell(
                                  onTap: () {
                                    js.context.callMethod(
                                      'open',
                                      [projectUtils.iosLink],
                                    );
                                  },
                                  child: Image.asset(AssetsManager.iosImage,
                                      width: WidthSizeManager.w12),
                                ),
                              )
                            : const SizedBox.shrink(),
                        (projectUtils.webLink.isNotEmpty)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: WidthSizeManager.w6),
                                child: InkWell(
                                  onTap: () {
                                    js.context.callMethod(
                                      'open',
                                      [projectUtils.webLink],
                                    );
                                  },
                                  child: Image.asset(AssetsManager.webImage,
                                      width: WidthSizeManager.w12),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ))
              ])),
    );
  }
}
