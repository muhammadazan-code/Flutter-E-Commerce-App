import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class TProductDetailImageSlider extends StatelessWidget {
  const TProductDetailImageSlider({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColor.darkerGrey : TColor.light,
        child: Stack(
          children: [
            // Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(imagePath))),
              ),
            ),
            // Image Slidder
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return TCircularImage(
                      image: TImagePath.productShirt,
                      width: 80,

                      border: Border.all(color: TColor.textPrimary),
                      padding: TSizes.sm,
                      backgroundColor: dark ? TColor.dark : TColor.white,
                    );
                  },
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: TSizes.spaceBetweenItems),
                  itemCount: 4,
                ),
              ),
            ),
            // AppBar Icon
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, iconColor: TColor.redColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
