import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/brands_products.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAllBrandScreen extends StatelessWidget {
  const TAllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              TSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: TSizes.spaceBetweenItems),
              // Brands
              TGridLayout(
                itemCount: 10,
                itemBuilder: (_, context) => TBrandCard(
                  imagePath: TImagePath.nikeWildHorse,
                  title: 'Nike',
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandsProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
