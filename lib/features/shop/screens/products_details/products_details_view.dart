import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_review_view.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/bottom_Add_cart_widget.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/product_detail_images_slider.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/products_attributes.dart';
import 'package:e_commerce/features/shop/screens/products_details/widgets/rate_and_share_widget.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slidder
            TProductDetailImageSlider(imagePath: imagePath),
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
                  TProductAttributes(),
                  SizedBox(height: TSizes.md),
                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Continue"),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems / 2),
                  // Description
                  TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBetweenItems / 2),
                  ReadMoreText(
                    'This is the Product Description for the Nike Silver less vest. These are the things that can be added but I am ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Show less',
                    trimCollapsedText: 'Show more',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Reviews
                  Divider(),
                  SizedBox(height: TSizes.spaceBetweenSections),
                  Row(
                    children: [
                      TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => TProductReviewScreen()),
                        icon: Icon(Iconsax.arrow_right_1),
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBetweenSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
