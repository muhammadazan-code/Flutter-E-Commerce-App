import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/products/cart/add_and_remove.dart';
import 'package:e_commerce/commons/widgets/products/cart/t_cart_item.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartScreen extends StatelessWidget {
  const TCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              SizedBox(height: TSizes.spaceBetweenItems),
          itemCount: 14,
          itemBuilder: (context, index) => Column(
            children: [
              TCartItem(imagePath: TImagePath.leatherJacket4),
              SizedBox(height: TSizes.spaceBetweenItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      // Add and Remove button
                      TProductQuantityWithAddAndRemoveButton(),
                    ],
                  ),
                  // Product Price Totals
                  TProductPrice(price: '234'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
