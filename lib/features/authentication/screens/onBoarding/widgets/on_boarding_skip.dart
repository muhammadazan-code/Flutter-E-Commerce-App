import 'package:e_commerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtilities.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: Text("Skip")),
    );
  }
}
