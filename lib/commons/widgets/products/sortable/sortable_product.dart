import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/products/product_cart/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(icon: Icon(Iconsax.sort)),
          items:
              [
                'Name',
                'Higher Price',
                'Lower Price',
                'Sale',
                'Newest',
                'Popularity',
              ].map((option) {
                return DropdownMenuItem(child: Text(option));
              }).toList(),
          onChanged: (value) {},
        ),
        SizedBox(height: TSizes.spaceBetweenSections),
        TGridLayout(
          itemCount: 12,
          itemBuilder: (_, index) => TProductCardVertical(
            title: 'Nike',
            imagePath: TImagePath.nikeAirJordanBlackRed,
          ),
        ),
      ],
    );
  }
}
