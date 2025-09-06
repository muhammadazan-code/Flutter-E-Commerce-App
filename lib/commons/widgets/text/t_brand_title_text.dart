import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    required this.color,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
    this.maxlines = 1,
  });
  final String title;
  final Color color;
  final TextAlign textAlign;
  final TextSizes brandTextSizes;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSizes == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          : brandTextSizes == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
