

import 'package:blockchain_landregistry1/Widgets/routing/routes.dart';
import 'package:blockchain_landregistry1/Widgets/side_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/reponsiveness.dart';
import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                     Flexible(
                      child: CustomText(
                        text: "User DashBoard",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1), ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                itemName: itemName == AuthenticationPageRoute ?"Log Out": itemName,

                onTap: () {
                  if(itemName == AuthenticationPageRoute){
                    
                      }
                  if(!menuController.isActive(itemName)){
                    menuController.changeActiveItemTo(itemName);
                    if(ResponsiveWidget.isSmallScreen(context))
                      Get.back();
    }
                  // if(item.route == AuthenticationPageRoute){
                  //   Get.offAllNamed(authenticationPageRoute);
                  //   menuController.changeActiveItemTo(overviewPageDisplayName);
                  }
                  // if (!menuController.isActive(item.name)) {
                  //   menuController.changeActiveItemTo(item.name);
                  //   if(ResponsiveWidget.isSmallScreen(context)) {
                  //     Get.back();
                  //   }
                  //   navigationController.navigateTo(item.route);
                  // }
                ))
                .toList(),
          )
        ],
      ),
    );
  }
}
