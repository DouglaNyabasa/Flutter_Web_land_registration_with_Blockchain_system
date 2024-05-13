import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../Widgets/routing/routes.dart';
import '../constants/style.dart';


class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = UserDashboardRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case UserDashboardRoute:
        return _customIcon(Icons.dashboard, itemName);
      case AddLandScreenRoute:
        return _customIcon(Icons.add_photo_alternate_outlined, itemName);
      case MyLandScreenRoute:
        return _customIcon(Icons.photo, itemName);
      case LandGalleryRoute:
        return _customIcon(Icons.photo_library_outlined, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
