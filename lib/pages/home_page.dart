// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'package:my_portfolio/core/config/size_config.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer_section.dart';
import 'package:my_portfolio/widgets/header_deasktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/experience_section.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navKeys =
      List<GlobalKey>.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColor.scaffoldBg,
        endDrawer: constraints.maxWidth > WidthSizeManager.kMinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  //DO:Call
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navKeys.first),
              //MAIN
              if (constraints.maxWidth > WidthSizeManager.kMinDesktopWidth)
                HeaderDeasktop(
                  onNavMenuTap: (int navIndex) {
                    //DO:Call Function
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              (constraints.maxWidth > WidthSizeManager.kMinDesktopWidth)
                  ?  MainDesktop(onTab: (int index){
                    //DO:Call Function
                    scrollToSection(4);
                  })
                  :  MainMobile(onTab:(int index){

                  }),

              //SKILLS
              Container(
                key: navKeys[1],
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: AppColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      StringsManager.whatCanIDo,
                      style: TextStyle(
                          fontSize: FontSizeManager.f24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whitePrimary),
                    ),
                    const SizedBox(height: HeightSizeManager.h20),
                    //Platform & Skills
                    (constraints.maxWidth >=
                            WidthSizeManager.kMediumDesktopWidth)
                        ? const SkillsDesktop()
                        : const SkillsMobile(),
                  ],
                ),
              ),
              //EXPERIENCE
               ExperienceSection(key: navKeys[2]),

              //PROJECTS
              ProjectSection(key: navKeys[3]),
              const SizedBox(height: HeightSizeManager.h30),

              //CONTACTS
              ContactSection(
                key: navKeys[4],
              ),
              const SizedBox(height: HeightSizeManager.h30),

              //FOOTER
              const FooterSection()
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      js.context.callMethod(
                                  'open',
                                  ["https://godadev.com/blogs/"],
                                );

      return;
    }
    final key = navKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
