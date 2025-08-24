import 'package:e_commerce/features/authentication/controller_onboarding/on_boarding_controller.dart';
import 'package:e_commerce/features/authentication/screens.onboarding/widgets/on_boarding_navigation.dart';
import 'package:e_commerce/features/authentication/screens.onboarding/widgets/on_boarding_next_button.dart';
import 'package:e_commerce/features/authentication/screens.onboarding/widgets/on_boarding_page.dart';
import 'package:e_commerce/features/authentication/screens.onboarding/widgets/on_boarding_skip.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImageSize.onBoardingImage1,
                subtitle: TText.onBoardingSubTitle1,
                title: TText.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: TImageSize.onBoardingImage2,
                subtitle: TText.onBoardingSubTitle2,
                title: TText.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: TImageSize.onBoardingImage3,
                subtitle: TText.onBoardingSubTitle3,
                title: TText.onBoardingTitle3,
              ),
            ],
          ),
          OnBoardingSkip(),
          OnboardingNavigation(),
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
