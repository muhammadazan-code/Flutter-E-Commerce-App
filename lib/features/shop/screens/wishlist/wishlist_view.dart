import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/products/product_cart/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Icon(Iconsax.add),
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TProductCardVertical(
                    title: "title",
                    imagePath: "imagePath",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
