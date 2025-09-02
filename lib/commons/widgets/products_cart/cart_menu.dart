import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterWidget extends StatelessWidget {
  const TCartCounterWidget({
    super.key,

    required this.iconColor,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: TColor.error.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: TColor.white,
                  fontSize: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
