import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
     this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: AppColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(HeightSizeManager.h15),
        filled: true,
        fillColor: AppColor.whiteSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.hintDark,
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none);
}
