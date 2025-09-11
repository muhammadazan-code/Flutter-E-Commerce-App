import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          iconColor: dark ? TColor.white : TColor.black,
          height: 32,
          size: TSizes.md,
          backgroundColor: dark ? TColor.darkerGrey : TColor.light,
        ),
        SizedBox(width: TSizes.spaceBetweenItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBetweenItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          iconColor: TColor.white,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColor.primaryColor,
        ),
      ],
    );
  }
}
