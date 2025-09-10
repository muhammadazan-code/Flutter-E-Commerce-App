import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddCart extends StatelessWidget {
  const TBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? TColor.darkerGrey : TColor.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                iconColor: TColor.white,
                width: 40,
                height: 40,
                backgroundColor: TColor.darkGrey,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: TSizes.spaceBetweenItems),
              TCircularIcon(
                icon: Iconsax.add,
                iconColor: TColor.white,
                width: 40,
                height: 40,
                backgroundColor: TColor.blackColor,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: TColor.blackColor,
              side: BorderSide(color: TColor.blackColor),
            ),
            onPressed: () {},
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
