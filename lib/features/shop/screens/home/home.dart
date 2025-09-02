import 'package:e_commerce/commons/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/search_container.dart';
import 'package:e_commerce/commons/widgets/image_text_widgets/vertical_image_text_widget.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBetweenItems),
                  // Search Bar
                  TSearchContainer(text: "Search in Store"),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          showActionButton: false,
                          title: "Popular Categories",
                          textColor: TColor.textWhite,
                        ),
                        SizedBox(height: TSizes.spaceBetweenItems),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return TVerticalImageText(
                                image: "image",
                                title: "Shoes",
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
