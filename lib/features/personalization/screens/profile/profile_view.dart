import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              TProfileMenu(title: "Name", value: "Azan", onPressed: () {}),
              TProfileMenu(
                title: "Username",
                value: "azan21",
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBetweenItems),
              Divider(),
              SizedBox(height: TSizes.spaceBetweenItems),
              // Heading Personal Info
              TProfileMenu(title: "User Id", value: "45334", onPressed: () {}),
              TProfileMenu(
                title: "E-mail",
                value: "azan@gmail.com",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Phone Number",
                value: "+92399939993",
                onPressed: () {},
              ),
              TProfileMenu(title: "Gender", value: "Male", onPressed: () {}),
              TProfileMenu(
                title: "Date of Birth",
                value: "10 Oct, 2002",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
