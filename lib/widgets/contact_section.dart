import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/services/services.dart';
import 'dart:js' as js;

import 'package:my_portfolio/widgets/custom_text_field.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});
  final TextEditingController yourName = TextEditingController();
  final TextEditingController yourEmail = TextEditingController();
  final TextEditingController yourMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(WidthSizeManager.w25,
          HeightSizeManager.h20, WidthSizeManager.w25, HeightSizeManager.h60),
      color: AppColor.bgLight1,
      child: Column(
        children: [
          const Text(StringsManager.getInTouch,
              style: TextStyle(
                  fontSize: FontSizeManager.f24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whitePrimary)),
          const SizedBox(height: HeightSizeManager.h50),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: WidthSizeManager.w700,
                maxHeight: HeightSizeManager.h100),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= WidthSizeManager.kMinDesktopWidth) {
                return buildNameAndEmailFieldDesktop();
              } else {
                return buildNameAndEmailFieldMobile();
              }
            }),
          ),
          const SizedBox(height: HeightSizeManager.h15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: WidthSizeManager.w700),
            child: CustomTextField(
                hintText: StringsManager.yourMessage,
                controller: yourMessage,
                maxLines: 10),
          ),
          const SizedBox(height: HeightSizeManager.h20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: WidthSizeManager.w700),
            child: SizedBox(
              width: double.maxFinite,
              height: HeightSizeManager.h50,
              child: ElevatedButton(
                  onPressed: () {
                    // sendEmail(yourName.text, yourEmail.text, yourMessage.text)
                    Services.sendEmail(yourName.text, yourEmail.text,
                        StringsManager.getInTouch, yourMessage.text);
                        yourName.clear();
                        yourEmail.clear();
                        yourMessage.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.yellowPrimary,
                  ),
                  child: const Text(
                    StringsManager.getInTouch,
                    style: TextStyle(
                        color: AppColor.whitePrimary,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          const SizedBox(height: HeightSizeManager.h30),
          ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: WidthSizeManager.w300),
              child: const Divider()),
          const SizedBox(height: HeightSizeManager.h15),
          //SNS icon button links
          Wrap(
            spacing: WidthSizeManager.w12,
            runSpacing: WidthSizeManager.w12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [StringsManager.githubLink],
                  );
                },
                child: Image.asset(
                  AssetsManager.githubIconImage,
                  width: WidthSizeManager.w28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [StringsManager.linkedInLink],
                  );
                },
                child: Image.asset(
                  AssetsManager.linkedInImage,
                  width: WidthSizeManager.w28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [StringsManager.telegramLink],
                  );
                },
                child: Image.asset(
                  AssetsManager.telegramImage,
                  width: WidthSizeManager.w28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameAndEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
            child: CustomTextField(
                hintText: StringsManager.yourName,
                controller: yourName,
                maxLines: 1)),
        const SizedBox(width: WidthSizeManager.w15),
        Flexible(
            child: CustomTextField(
                hintText: StringsManager.yourEmail,
                controller: yourEmail,
                maxLines: 1))
      ],
    );
  }

  Column buildNameAndEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
            child: CustomTextField(
                hintText: StringsManager.yourName,
                controller: yourName,
                maxLines: 1)),
        const SizedBox(height: HeightSizeManager.h15),
        Flexible(
            child: CustomTextField(
                hintText: StringsManager.yourEmail,
                controller: yourEmail,
                maxLines: 1))
      ],
    );
  }

  void sendEmail(String name, String recipientemail, String message) async {
    // final Email email = Email(
    // body: StringsManager.yourMessage,
    // subject: StringsManager.getInTouch,
    // recipients: [recipientemail],
    // isHTML: false);
    // await FlutterEmailSender.send(email);
  }
}
