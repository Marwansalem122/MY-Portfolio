import 'package:flutter/material.dart';
import 'package:my_portfolio/controllers/home_controller.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/height_size_manager.dart';
import 'package:my_portfolio/core/constants/width_size_manager.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
   crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
     //PlatForms
     ConstrainedBox(
       constraints: const BoxConstraints(
         maxWidth: WidthSizeManager.w450,
       ),
       child: Wrap(
         spacing: 5,
         runSpacing: 5,
         children: [
           for (int i = 0;
               i < HomeController.platFormItems.length;
               i++)
             Container(
               width: 200,
               decoration: BoxDecoration(
                 color: AppColor.bgLight2,
                 borderRadius: BorderRadius.circular(5),
               ),
               child: ListTile(
                 contentPadding: const EdgeInsets.symmetric(
                     horizontal: WidthSizeManager.w20,
                     vertical: HeightSizeManager.h10),
                 leading: Image.asset(
                     HomeController.platFormItems[i]["img"],
                     width: WidthSizeManager.w26),
                 title: Text(
                     HomeController.platFormItems[i]["title"]),
               ),
             )
         ],
       ),
     ),
     const SizedBox(width: WidthSizeManager.w45),
     //Skills
     Flexible(
       child: ConstrainedBox(
         constraints: const BoxConstraints(
             maxWidth: WidthSizeManager.w500),
         child: Wrap(
           spacing: 10,
           runSpacing: 10,
           children: [
             for (int i = 0;
                 i < HomeController.mySkills.length;
                 i++)
               Chip(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
                 backgroundColor: AppColor.bgLight2,
                 padding: const EdgeInsets.symmetric(
                   vertical: HeightSizeManager.h12,
                   horizontal: WidthSizeManager.w16,
                 ),
                 label:
                     Text(HomeController.mySkills[i]["title"]),
                 avatar: Image.asset(
                     HomeController.mySkills[i]["img"]),
               )
           ],
         ),
       ),
     )
   ],
 );
  }
}