import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          backgroundColor: dark ? TColor.black : TColor.white,
          indicatorColor: dark
              ? TColor.white.withOpacity(0.1)
              : TColor.black.withOpacity(0.1),
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (value) =>
              controller.selectedindex.value = value,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedindex.value]),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedindex = 0.obs;
  final screen = [
    Container(color: Colors.blue),
    Container(color: Colors.amber),
    Container(color: Colors.grey),
    Container(color: Colors.purple),
  ];
}
