import 'package:e_commerce/commons/style/shadow_style.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/commons/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/commons/widgets/text/product_title_text.dart';
import 'package:e_commerce/commons/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/features/shop/screens/products_details/products_details_view.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
    this.title = "",
    this.imagePath = "",
    this.iconColor = TColor.buttonPrmary,
  });
  final String title;
  final String imagePath;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductsDetailsScreen(imagePath: imagePath)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColor.darkerGrey : TColor.white,
        ),
        child: Column(
          children: [
            // Thumbnail, wishlist Button, Discount Tag
            SizedBox(
              height: 120,
              child: TCircularContainer(
                height: 100,
                width: 350,
                radius: 15,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColor.dark : TColor.light,
                child: Stack(
                  children: [
                    // Thumbnail Image
                    TRoundedImage(
                      fit: BoxFit.cover,
                      isNetworkImage: false,
                      imageUrl: imagePath,
                      appplyImageRadius: false,
                    ),
                    //Sales Tag
                    Positioned(
                      top: 8,
                      child: TCircularContainer(
                        width: 40,
                        height: 20,
                        radius: TSizes.sm,
                        backgroundColor: TColor.secondary.withOpacity(.8),
                        child: Text(
                          "25%",
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(color: TColor.black),
                        ),
                      ),
                    ),
                    // Wishlist
                    Align(
                      alignment: Alignment.topRight,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        iconColor: TColor.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title, smallSize: true, maxLines: 1),
                  SizedBox(width: TSizes.spaceBetweenItems / 2),
                  TBrandTitleWithVerifiedIcon(
                    title: "Nike",
                    iconColor: iconColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Price
                      TProductPrice(price: "35.0"),
                      // Button
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          height: TSizes.iconLg * 1.2,
                          width: TSizes.iconLg * 1.2,
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
          ],
        ),
      ),
    );
  }
}
