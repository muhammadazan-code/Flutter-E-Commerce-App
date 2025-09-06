import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_utilities.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColor.black : TColor.white,
      child: TabBar(
        indicatorColor: TColor.primaryColor,
        labelColor: dark ? TColor.white : TColor.primaryColor,
        unselectedLabelColor: TColor.darkGrey,
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtilities.getAppBarHeight());
}
