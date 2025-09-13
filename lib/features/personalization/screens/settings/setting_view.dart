import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:e_commerce/commons/widgets/listtile/setting_menu_title.dart';
import 'package:e_commerce/commons/widgets/listtile/user_profile_tile.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/Order/order_view.dart';
import 'package:e_commerce/features/personalization/screens/address/address_view.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_view.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              height: THelperFunctions.screenWidth(context) * .6,
              child: Column(
                children: [
                  // AppBar
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: TColor.textWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBetweenSections),
                  // User Profile Card
                  TUserProfileTitle(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBetweenSections),
                ],
              ),
            ),
            // body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Setting
                  TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems),
                  TSettingsMenuTile(
                    title: "My Addresses",
                    subtitle: "Set Shopping Delivery Adresses",
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "My Orders",
                    subtitle: "In-progress and Completed Orders",
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "My Coupons",
                    subtitle: "List of all the discounted Coupons",
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "Notification",
                    subtitle: "Set any kind of notification message",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),
                  SizedBox(height: TSizes.spaceBetweenSections),
                  // App Settings
                  TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems),
                  TSettingsMenuTile(
                    title: "Load Data",
                    subtitle: "Upload data to your Cloud Firebase",
                    icon: Iconsax.document_upload,
                  ),
                  TSettingsMenuTile(
                    title: "Geolocations",
                    subtitle: "Set Recommendation based on locations",
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    icon: Iconsax.security_card,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    title: "HD Image Quality",
                    subtitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                    icon: Iconsax.image,
                  ),
                  // Log out button
                  SizedBox(height: TSizes.spaceBetweenSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBetweenSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
