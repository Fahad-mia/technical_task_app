import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';

import '../controller/onboard_screen_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingScreenController controller = Get.put(OnboardingScreenController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("Onboarding", true),
      backgroundColor: AppColors.screenColors,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Image Slider Box
              Container(
                width: double.infinity,
                height: screenSize.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.images.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(controller.images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Headline and Title Text
              Obx(() => CustomTextContainer(
                headText: controller.currentIndex.value !=
                    controller.images.length - 1
                    ? AppText.textOnBoardBold
                    : AppText.textOnBoardBold2,
                titleText: controller.currentIndex.value !=
                    controller.images.length - 1
                    ? AppText.textOnBoardNormal
                    : AppText.textOnBoard2Normal,
              )),

              const SizedBox(height: 20),

              // Dot Indicators
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.images
                      .asMap()
                      .entries
                      .map(
                        (item) => Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex.value == item.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  )
                      .toList(),
                );
              }),

              const SizedBox(height: 30),

              // Next / Get Started Button
              Obx(() {
                return CustomButton(
                  label: controller.currentIndex.value !=
                      controller.images.length - 1
                      ? "Next"
                      : "Get Started",
                  width: screenSize.width * 0.88,
                  borderRadius: 100,
                  onPressed: controller.currentIndex.value !=
                      controller.images.length - 1
                      ? controller.nextPage
                      : () => Get.toNamed(AppRoutes.signIn),
                );
              }),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
