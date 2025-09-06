import 'package:e_commerce/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      showBorder: true,
      radius: 20,
      height: 200,
      borderColor: TColor.darkGrey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBetweenItems),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Brand with Products Count
          Flexible(
            child: TBrandCard(
              showBorder: false,
              imagePath: TImagePath.nikeLogo,
              title: TText.namesOfLogosBrands[1],
            ),
          ),
          // Brand Tags and Product Images
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final dark = THelperFunctions.isDarkMode(context);
  return Expanded(
    child: TCircularContainer(
      height: 100,
      radius: 20,
      padding: EdgeInsets.all(TSizes.sm),
      margin: EdgeInsets.only(right: TSizes.sm),
      backgroundColor: dark ? TColor.darkGrey : TColor.light,
      child: Image(image: AssetImage(image), fit: BoxFit.contain),
    ),
  );
}
