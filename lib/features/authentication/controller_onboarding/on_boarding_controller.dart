import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  // Variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  // Update Current Index when page scroll
  void updatePageIndicator(int? index) => currentPageIndex.value = index!;
  // Jump to the specific dot selected page
  void dotNavigationClick(int? index) {
    currentPageIndex.value = index!;
    pageController.jumpToPage(currentPageIndex.value);
  }

  // Update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
