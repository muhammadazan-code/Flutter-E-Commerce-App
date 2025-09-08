
import 'package:e_commerce/commons/widgets/text/t_brand_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.iconColor = TColor.primaryBackground,
    this.textAlign = TextAlign.center,
    this.brandTextTitleSize = TextSizes.small,
    this.textColor = TColor.dark,
  });
  final String title;
  final int maxlines;
  final Color iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextTitleSize;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            textAlign: textAlign,
            maxlines: maxlines,
            brandTextSizes: brandTextTitleSize,
          ),
        ),
        SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}
