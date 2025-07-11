// import 'package:flutter/material.dart'; // Changed from animation.dart to material.dart for general UI
// import 'package:get/get.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// // Ensure LoginScreen is accessible from this path.
// // If LoginScreen is in a separate file, make sure it's exported or imported directly.
// import '../views/auth/register_screen.dart'; // Assuming LoginScreen is defined or exported here
//
// class OnboardingController extends GetxController {
//   // Initialize CarouselController
//   final CarouselController carouselController = CarouselController();
//   // Reactive integer to track the current slide index
//   final RxInt currentIndex = 0.obs;
//
//   /// Navigates to the next slide or to the LoginScreen if at the last slide.
//   void nextSlide() {
//     // Check if there are more slides to advance to.
//     // The current logic works for 2 slides (index 0 and 1).
//     // If you have more slides, you'd typically compare currentIndex.value with (totalSlides - 1).
//     // For example, if 'images' list length is available here, you could use:
//     // if (currentIndex.value < totalNumberOfSlides - 1)
//     if (currentIndex.value < 1) { // This condition means it moves from index 0 to 1
//       currentIndex.value++; // Increment the index for the next slide
//       // Animate the carousel to the new page
//       carouselController.animateToPage(
//         currentIndex.value,
//         duration: const Duration(milliseconds: 300), // Duration of the animation
//         curve: Curves.easeIn, // Animation curve
//       );
//     } else {
//       // If at the last slide (index 1 in this case), navigate to LoginScreen
//       Get.off(() => const LoginScreen()); // Replaces the current route with LoginScreen
//     }
//   }
// }
