import 'package:e_commerce/features/shop/screens/cart/cart_view.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterWidget extends StatelessWidget {
  const TCartCounterWidget({
    super.key,

    this.iconColor = TColor.darkGrey,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const TCartScreen()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          top: 3,
          right: 5,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColor.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: TColor.white,
                  // fontSize: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
