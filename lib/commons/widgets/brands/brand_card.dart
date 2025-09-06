import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/commons/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.imagePath,
    required this.title,
  });
  final bool showBorder;
  final void Function()? onTap;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        radius: TSizes.cardRadiusLg,
        showBorder: showBorder,
        width: 500,
        borderColor: dark ? TColor.light : TColor.black,
        padding: EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icons
            Flexible(
              child: TCircularImage(
                image: imagePath,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColor.white : TColor.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBetweenItems / 9),
            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: title,
                    iconColor: TColor.buttonPrmary,
                    textColor: dark ? TColor.white : TColor.dark,
                    brandTextTitleSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
