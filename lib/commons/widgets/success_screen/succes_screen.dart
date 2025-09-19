import 'package:e_commerce/commons/style/spacing_style.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.image = TImagePath.successfullyRegisterAnimation,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Image
              Lottie.asset(
                image,
                width: THelperFunctions.screenWidth(context) * .6,
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),
              // Title and Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: dark ? TColor.light : TColor.dark,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(TText.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
