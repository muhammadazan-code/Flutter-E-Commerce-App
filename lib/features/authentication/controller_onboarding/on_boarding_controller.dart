import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Variables
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // Get.to(LoginScreen());
    } else {
      int page =currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }
  // Update Current Index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
