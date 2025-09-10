import 'package:e_commerce/commons/widgets/chips/choice_chips.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/commons/widgets/text/product_title_text.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected attributes pricing and Descriptions
        TCircularContainer(
          width: double.infinity,
          height: 120,
          radius: 20,
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: darkMode ? TColor.darkerGrey : TColor.grey,
          child: Column(
            children: [
              // Titile, Price and Stack Status
              Row(
                children: [
                  TSectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: TSizes.spaceBetweenItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Price ",
                            smallSize: true,
                          ),
                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBetweenItems),
                          // Sale Price
                          const TProductPrice(price: "20"),
                        ],
                      ),
                      // Stack
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Stack ",
                            smallSize: true,
                          ),
                          Text(
                            'In Stack',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //Variation Description
              TProductTitleText(
                title:
                    'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: "Colors", showActionButton: false),
            SizedBox(height: TSizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: "Green",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: TSizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8.0,
              children: [
                TChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
