import 'package:e_commerce/commons/widgets/shimmer_effect/shimmer_effect_widget.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (_, _) => SizedBox(width: TSizes.spaceBetweenItems),
        itemCount: itemCount,
        itemBuilder: (context, index) => Column(
          children: [
            /// Image
            TShimmerEffect(width: 55, height: 55, radius: 55),
            SizedBox(height: TSizes.spaceBetweenItems / 2),

            /// Text
            TShimmerEffect(width: 55, height: 10, radius: 8),
          ],
        ),
      ),
    );
  }
}
