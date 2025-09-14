import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, idndex) =>
          SizedBox(height: TSizes.spaceBetweenItems),
      itemCount: 10,
      itemBuilder: (context, index) => TCircularContainer(
        height: (THelperFunctions.screenWidth(context) * .4) - 15,
        radius: 20,
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColor.dark : TColor.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row
            Row(
              children: [
                // Icons
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBetweenItems / 2),
                // Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: TColor.primaryColor,
                          fontWeightDelta: 1,
                        ),
                      ),

                      Text(
                        '07 Nov 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_14, size: TSizes.iconSm),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBetweenItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Icons
                      Icon(Iconsax.tag),
                      SizedBox(width: TSizes.spaceBetweenItems / 2),
                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),

                            Text(
                              '[#25g6df6]',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Icons
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.spaceBetweenItems / 2),
                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),

                            Text(
                              '03 Feb 2025',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
