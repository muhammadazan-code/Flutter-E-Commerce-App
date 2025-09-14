import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/commons/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/commons/widgets/text/product_title_text.dart';
import 'package:e_commerce/commons/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColor.darkerGrey : TColor.softGrey,
      ),
      child: Row(
        children: [
          // Thumbnail
          TCircularContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColor.dark : TColor.light,
            child: Stack(
              children: [
                // Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageUrl: TImagePath.productShirt,
                    appplyImageRadius: true,
                  ),
                ),
                // Sales Tag
                Positioned(
                  top: 12,
                  child: TCircularContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColor.secondary.withOpacity(.8),
                    padding: EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                      vertical: TSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: TColor.blackColor),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: TColor.redColor,
                  ),
                ),
              ],
            ),
          ),
          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Green Nike Half Slaves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBetweenItems / 2),
                      TBrandTitleWithVerifiedIcon(
                        title: 'Nike',
                        iconColor: TColor.primaryColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TProductPrice(price: '26.0-30.0')),
                      // Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomLeft: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColor.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
