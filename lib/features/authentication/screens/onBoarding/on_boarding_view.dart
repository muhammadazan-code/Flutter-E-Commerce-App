import 'package:e_commerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/on_boarding_navigation.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/on_boarding_next_button.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/on_boarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/on_boarding_skip.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImagePath.onBoardingImage1,
                subtitle: TText.onBoardingSubTitle1,
                title: TText.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: TImagePath.onBoardingImage2,
                subtitle: TText.onBoardingSubTitle2,
                title: TText.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: TImagePath.onBoardingImage3,
                subtitle: TText.onBoardingSubTitle3,
                title: TText.onBoardingTitle3,
              ),
            ],
          ),
          Obx(() {
            return controller.currentPageIndex.value < 2
                ? OnBoardingSkip()
                : Container();
          }),
          OnboardingNavigation(),
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
