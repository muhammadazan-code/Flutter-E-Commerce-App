import 'package:e_commerce/features/authentication/controller_onboarding/on_boarding_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utilities.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakrMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtilities.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: dark ? TColor.primaryColor : Colors.black,
        ),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(Iconsax.arrow_right3,color: dark? Colors.white: Colors.black,),
      ),
    );
  }
}
