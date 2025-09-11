import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class TRatingBar extends StatelessWidget {
  const TRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: 4,
      itemSize: 20,
      unratedColor: TColor.grey,

      itemBuilder: (context, index) =>
          Icon(Iconsax.star1, color: TColor.primaryColor),
    );
  }
}
