import 'package:e_commerce/commons/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/commons/widgets/text/product_title_text.dart';
import 'package:e_commerce/commons/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedImage(imageUrl: imagePath, width: 50, height: 50),
        SizedBox(width: TSizes.spaceBetweenItems),
        // Title , price and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(
                child: TProductTitleText(
                  title: 'Black sports shoe',
                  maxLines: 1,
                ),
              ),
              // Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
