import 'package:e_commerce/commons/widgets/products/cart/add_and_remove.dart';
import 'package:e_commerce/commons/widgets/products/cart/t_cart_item.dart';
import 'package:e_commerce/commons/widgets/text/product_price.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.showAddRemove = true, this.length = 14});
  final bool showAddRemove;
  final int length;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: TSizes.spaceBetweenItems),
      itemCount: length,
      itemBuilder: (context, index) => Column(
        children: [
          TCartItem(imagePath: TImagePath.leatherJacket4),
          if (showAddRemove) SizedBox(height: TSizes.spaceBetweenItems),
          if (showAddRemove)
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
    );
  }
}
