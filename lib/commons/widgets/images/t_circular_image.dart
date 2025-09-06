import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    required this.image,
  });
  final double width;
  final double height;
  final Color? overlayColor;
  final double padding;
  final bool isNetworkImage;
  final BoxFit fit;
  final Color? backgroundColor;
  final String image;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? TColor.black : TColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
          color: overlayColor,
        ),
      ),
    );
  }
}
