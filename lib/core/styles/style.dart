import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';

class Style {
  static BoxDecoration kHeaderDecoration=  BoxDecoration(
     gradient: const LinearGradient(
         colors: [Colors.transparent, AppColor.bgLight1]),
     borderRadius: BorderRadius.circular(100));
}