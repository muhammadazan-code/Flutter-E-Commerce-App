import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/commons/widgets/text/product_title_text.dart';
import 'package:e_commerce/commons/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Sale Price
        Row(
          children: [
            TCircularContainer(
              width: 60,
              height: 30,
              radius: TSizes.sm,
              backgroundColor: TColor.secondary.withOpacity(.8),
              padding: EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Center(
                child: Text(
                  "25%",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: TColor.black),
                ),
              ),
            ),
            SizedBox(width: TSizes.spaceBetweenItems),
            // Price
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: TSizes.spaceBetweenItems),
            TProductPrice(price: '175', isLarge: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems / 1.5),
        // Title
        TProductTitleText(title: "Green Nike Sports Shirt"),
        SizedBox(height: TSizes.spaceBetweenItems / 1.5),
        // Stock Status
        Row(
          children: [
            TProductTitleText(title: "Status"),
            SizedBox(width: TSizes.spaceBetweenItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems / 1.5),
        // Brands
        Row(
          children: [
            TCircularImage(
              image: TImagePath.nikeLogo,
              overlayColor: darkMode ? TColor.white : TColor.blackColor,
              height: 32,
              width: 32,
            ),
            SizedBox(width: TSizes.xs),
            TBrandTitleWithVerifiedIcon(
              title: "Nike",
              iconColor: TColor.buttonPrmary,
              brandTextTitleSize: TextSizes.medium,
              textColor: darkMode ? TColor.textWhite : TColor.dark,
            ),
          ],
        ),
        SizedBox(height: TSizes.md),
      ],
    );
  }
}
