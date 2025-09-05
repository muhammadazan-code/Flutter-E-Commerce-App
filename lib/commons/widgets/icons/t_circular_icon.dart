import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size = TSizes.lg,
    required this.icon,
  });
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: dark
            ? TColor.black.withOpacity(.9)
            : TColor.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: color,
        iconSize: size,
      ),
    );
  }
}
