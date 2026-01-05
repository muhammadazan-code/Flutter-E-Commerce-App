import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.isNetworkImage = true,
    this.textColor = TColor.white,
    this.backgroundColor = TColor.white,
  });
  final void Function()? onTap;
  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(TSizes.sm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Circular Icon
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              padding: TSizes.sm * 1.4,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColor.light : TColor.dark,
            ),
            // Text
            const SizedBox(height: TSizes.spaceBetweenItems / 2),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
