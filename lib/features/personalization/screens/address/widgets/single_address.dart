import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularContainer(
      showBorder: true,
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      height: 130,
      radius: 0,
      margin: EdgeInsets.only(bottom: TSizes.spaceBetweenItems),
      backgroundColor: selectedAddress
          ? TColor.primaryColor
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? TColor.darkerGrey
          : TColor.grey,
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress
                  ? dark
                        ? TColor.light
                        : TColor.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: TSizes.sm / 2),
              Text(
                '(+323) 333323 3223',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: TSizes.sm / 2),
              Text(
                '474674 Timy Conves, South Liana, Maine, USA',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: TSizes.sm / 2),
            ],
          ),
        ],
      ),
    );
  }
}
