import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/commons/widgets/products/product_cart/product_card_horizontal.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              TRoundedImage(
                imageUrl: TImagePath.promoBanner1,
                width: double.infinity,
                appplyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBetweenSections),
              // Sub Categories
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                    buttonTitle: 'View All',
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: TSizes.spaceBetweenItems),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, index) => TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
