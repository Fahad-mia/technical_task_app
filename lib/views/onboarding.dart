import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text/app_text_style.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';

import '../controller/onboard_controller.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  // Instantiate controller
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppbar("Onboarding", true),
      body: Container(
        color: AppColors.screenColors,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                left: screenSize.width * .095,
                top: screenSize.height * .09,
                width: screenSize.width * .82,
                height: screenSize.height * .33,
                child: Container(
                  color: Colors.white,
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
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                  top: screenSize.height * .51,
                  width: screenSize.width,
                  height: screenSize.height * .421,
                  child: Column(
                    children: [
                      SizedBox(
                          height: screenSize.height * .18,
                          width: screenSize.width * .9,
                          child: Obx(() =>
                              CustomTextContainer(
                                headText: controller.currentIndex.value !=
                                    controller.images.length - 1 ? AppText
                                    .textOnBoardBold : AppText
                                    .textOnBoardBold2,
                                titleText: controller.currentIndex.value !=
                                    controller.images.length - 1
                                    ? AppText.textOnBoardNormal
                                    : AppText.textOnBoard2Normal,))
                      ),
                      SizedBox(height: 30,),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.images
                              .asMap()
                              .entries
                              .map(
                                (item) {
                              return Container(
                                height: 12,
                                width: 12,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentIndex.value ==
                                      item.key
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                ),
                              );
                            },
                          ).toList(),
                        );
                      }),
                      const SizedBox(height: 40),
                      Obx(() {
                        return CustomButton(
                          label: controller.currentIndex.value !=
                              controller.images.length - 1
                              ? "Next"
                              : "Get Started",
                          width: screenSize.width * .88,
                          borderRadius: 100,
                          onPressed: controller.nextPage,
                        );
                      }),
                    ],
                  )),
            ],
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 250,
        //       child: PageView.builder(
        //         controller: controller.pageController,
        //         itemCount: controller.images.length,
        //         onPageChanged: controller.onPageChanged,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             margin: const EdgeInsets.all(5),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(15),
        //               image: DecorationImage(
        //                 image: AssetImage(controller.images[index]),
        //                 fit: BoxFit.fill,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     const SizedBox(height: 16),
        //     Obx(() {
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: controller.images.asMap().entries.map(
        //               (item) {
        //             return Container(
        //               height: 12,
        //               width: 12,
        //               margin: const EdgeInsets.all(4),
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: controller.currentIndex.value == item.key
        //                     ? Colors.blueAccent
        //                     : Colors.grey,
        //               ),
        //             );
        //           },
        //         ).toList(),
        //       );
        //     }),
        //     const SizedBox(height: 16),
        //     Obx(() {
        //       return CustomButton(
        //         label: controller.currentIndex.value !=
        //             controller.images.length - 1
        //             ? "Next"
        //             : "Get Started",
        //         width: screenSize.width * .88,
        //         borderRadius: 100,
        //         onPressed: controller.nextPage,
        //       );
        //     }),
        //   ],
        // ),
      ),
    );
  }
}
