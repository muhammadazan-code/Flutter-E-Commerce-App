import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width = 150,
    this.height = 150,
    required this.imageUrl,
    this.appplyImageRadius = true,
    this.fit = BoxFit.contain,
    this.backgroundColor = TColor.lightContainer,
    this.isNetworkImage = false,
    this.onPressed,
    this.border,
    this.padding,
    this.borderRadius = 12,
  });
  final double width, height;
  final String imageUrl;
  final bool appplyImageRadius;
  final BoxFit? fit;
  final Color backgroundColor;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: appplyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
