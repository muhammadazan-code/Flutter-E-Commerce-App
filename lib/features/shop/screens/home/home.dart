import 'package:e_commerce/commons/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/search_container.dart';
import 'package:e_commerce/commons/widgets/image_text_widgets/vertical_image_text_widget.dart';
import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/products/product_cart/product_card_vertical.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/all_product/all_product_view.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
                  SizedBox(height: TSizes.spaceBetweenSections),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        TSectionHeading(
                          showActionButton: false,
                          title: "Popular Categories",
                          textColor: TColor.textWhite,
                          buttonTitle: 'View All',
                          onPressed: () => Get.to(() => AllProductScreen()),
                        ),
                        SizedBox(height: TSizes.spaceBetweenItems),
                        // Categories
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: TImagePath.iconImages.length,
                            itemBuilder: (context, index) {
                              return TVerticalImageText(
                                image: TImagePath.iconImages[index],
                                title: TText.namesOfIcons[index],
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
            // Banners
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace / 5),
              child: Column(
                children: [
                  TPromoSlider(
                    banner: [
                      TImagePath.promoBanner1,
                      TImagePath.promoBanner2,
                      TImagePath.promoBanner3,
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems / 4),
                  TSectionHeading(
                    title: "Popular Products",
                    buttonTitle: "View All",
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems / 4),
                  TGridLayout(
                    mainAxisExtent:
                        (THelperFunctions.screenWidth(context) / 1.98) - .1,
                    itemCount: TImagePath.imagePathAdresses.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      title: TText.productNames[index],
                      imagePath: TImagePath.imagePathAdresses[index],
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
