import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce/commons/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandsProducts extends StatelessWidget {
  const BrandsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                imagePath: TImagePath.nikeAirJordanSingleBlue,
                title: 'Nike',
                showBorder: true,
              ),
              SizedBox(height: TSizes.spaceBetweenSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
