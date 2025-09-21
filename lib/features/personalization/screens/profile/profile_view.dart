import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/change_name_screen.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text("Profile"), showBackArrow: true),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      image: TImagePath.userImage,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              // Details
              SizedBox(height: TSizes.spaceBetweenItems / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBetweenItems),
              // Heading Personal Info
              TSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),
              TProfileMenu(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              TProfileMenu(
                title: "Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBetweenItems),
              Divider(),
              SizedBox(height: TSizes.spaceBetweenItems),
              // Heading Personal Info
              TProfileMenu(
                title: "User Id",
                value: controller.user.value.id,
                onPressed: () {},
              ),
              TProfileMenu(
                title: "E-mail",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(title: "Gender", value: "Male", onPressed: () {}),
              TProfileMenu(
                title: "Date of Birth",
                value: "10 Oct, 2002",
                onPressed: () {},
              ),
              Divider(),
              SizedBox(height: TSizes.defaultSpace / 9),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: TColor.redColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
