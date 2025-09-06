import 'package:e_commerce/commons/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/products/product_cart/product_card_vertical.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Brands
              TBrandShowcase(
                images: [
                  TImagePath.nikeAirJordanBlackRed,
                  TImagePath.nikeAirJordanOrange,
                  TImagePath.nikeAirJordanWhiteMagenta,
                ],
              ),
              // Products
              TSectionHeading(
                title: "You might like",
                onPressed: () {},
                buttonTitle: "View All",
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),
              TGridLayout(
                mainAxisExtent:
                    (THelperFunctions.screenWidth(context) / 1.98) - .1,
                itemCount: TText.sportsProductsNames.length,
                itemBuilder: (_, index) {
                  return TProductCardVertical(
                    title: TText.sportsProductsNames[index],
                    imagePath: TImagePath.sportsProductsPath[index],
                  );
                },
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),
            ],
          ),
        ),
      ],
    );
  }
}
