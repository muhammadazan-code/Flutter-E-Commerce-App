import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image.asset(
            image.toString(),
            width: THelperFunctions.screenWidth() * 0.6,
            height: THelperFunctions.screenHeight() * 0.6,
          ),
          // Image(
          //   width: THelperFunctions.screenWidth() * .8,
          //   height: THelperFunctions.screenHeight() * .6,
          //   image: AssetImage(image),
          // ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: TSizes.spaceBetweenItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
