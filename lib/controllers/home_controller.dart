import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';

class HomeController {
  static const List<String> navBarTextButtons = [
    StringsManager.home,
    StringsManager.skills,
    StringsManager.projects,
    StringsManager.contact,
    StringsManager.blog,
  ];
  static const List<IconData> navBarIconButton = [
    Icons.home,
    Icons.handyman_outlined,
    Icons.apps,
    Icons.quick_contacts_mail,
    Icons.web,
  ];
  static const List<Map> platFormItems = [
    {
      "img": AssetsManager.androidImage,
      "title": StringsManager.androidDev,
    },
    {
      "img": AssetsManager.iosImage,
      "title": StringsManager.iosDev,
    },
    {
      "img": AssetsManager.webImage,
      "title": StringsManager.webDev,
    },
    {
      "img": AssetsManager.desktopImage,
      "title": StringsManager.desktopDev,
    },
  ];

  static const List<Map> mySkills = [
    {
      "img": AssetsManager.dartImage,
      "title": StringsManager.dart,
    },
    {
      "img": AssetsManager.flutterImage,
      "title": StringsManager.flutter,
    },
    {
      "img": AssetsManager.htmlImage,
      "title": StringsManager.html,
    },
    {
      "img": AssetsManager.cssImage,
      "title": StringsManager.css,
    },
    {
      "img": AssetsManager.cppImage,
      "title": StringsManager.cpp,
    },
    {
      "img": AssetsManager.jsImage,
      "title": StringsManager.js,
    },
    {
      "img": AssetsManager.gitImage,
      "title": StringsManager.git,
    },
    {
      "img": AssetsManager.githubImage,
      "title": StringsManager.gitHub,
    },
  ];
}
