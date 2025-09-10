import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.backgroundColor = TColor.blackColor,
    this.size = TSizes.lg,
    required this.icon,
    this.iconColor = TColor.light,
  });
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? size;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor),
        iconSize: size,
      ),
    );
  }
}
