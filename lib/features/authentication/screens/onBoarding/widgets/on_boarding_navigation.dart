import 'package:e_commerce/features/authentication/controller_onboarding/on_boarding_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utilities.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtilities.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        onDotClicked: controller.dotNavigationClick,
        controller: controller.pageController,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColor.light : TColor.dark,
          dotHeight: 4,
        ),
      ),
    );
  }
}
