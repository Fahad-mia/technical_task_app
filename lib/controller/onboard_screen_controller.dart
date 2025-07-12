import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  final PageController pageController = PageController();
  final images = [
    'assets/signal_image.png',
    'assets/onboard_image2.png',
  ];

  // Reactive current index
  var currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < images.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page reached, add your logic here (e.g. navigate)
      print("End of onboarding");
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
