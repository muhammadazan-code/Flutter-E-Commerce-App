import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/products_cart/cart_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TText.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: TColor.grey),
          ),
          Text(
            TText.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: TColor.white),
          ),
        ],
      ),
      actions: [TCartCounterWidget(iconColor: TColor.white, onPressed: () {})],
    );
  }
}
