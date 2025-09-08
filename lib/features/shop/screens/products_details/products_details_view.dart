import 'package:e_commerce/features/shop/screens/products_details/widgets/product_detail_images_slider.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/rate_and_share_widget.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slidder
            TProductDetailImageSlider(),
            // Product Details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Ratings and share
                  TRatingAndShare(),
                  // Price, Title, stack and Brand
                  TProductMetaData(),
                  // Attributes
                  // Checkout Button
                  // Description
                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
