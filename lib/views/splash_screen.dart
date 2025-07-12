import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text/app_text_style.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Define a base multiplier for responsive font sizes, similar to previous screens
    final double baseFontSizeMultiplier = screenSize.width / 375;

    return Scaffold(
      appBar: CustomAppbar("SplashScreen", true),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFFFFFFF),
        child: Stack(
          children: [
            Positioned(
              top: screenSize.height * 0.18,
              left: screenSize.width * 0.06,
              right: screenSize.width * 0.06,
              // Removed the SizedBox with fixed height.
              // Let the Column determine its height based on its content.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Vertically center within its available space
                crossAxisAlignment: CrossAxisAlignment.center, // Horizontally center
                children: [
                  // Car image
                  SizedBox(
                    width: screenSize.width * 0.32,
                    height: screenSize.height * 0.14,
                    child: Image.asset("assets/car.png"),
                  ),
                  SizedBox(height: screenSize.height * 0.02),

                  // Texts
                  Text(
                    AppText.text1Bold,
                    textAlign: TextAlign.center,
                    // Apply responsive font size scaling
                    style: AppTextStyle.textStyleFigTree700Bold.copyWith(
                      fontSize: AppTextStyle.textStyleFigTree700Bold.fontSize != null
                          ? AppTextStyle.textStyleFigTree700Bold.fontSize! * baseFontSizeMultiplier
                          : 28 * baseFontSizeMultiplier, // Fallback font size
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Text(
                    AppText.text2Normal,
                    textAlign: TextAlign.center,
                    // Apply responsive font size scaling
                    style: AppTextStyle.textStyleInter400Regular.copyWith(
                      fontSize: AppTextStyle.textStyleInter400Regular.fontSize != null
                          ? AppTextStyle.textStyleInter400Regular.fontSize! * baseFontSizeMultiplier
                          : 16 * baseFontSizeMultiplier, // Fallback font size
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: screenSize.height * 0.78,
              left: screenSize.width * 0.44, // Keep left aligned or center it more robustly
              // To ensure the circular dot is truly centered horizontally:
              // left: (screenSize.width - (screenSize.width * 0.12)) / 2, // (screen_width - dot_width) / 2
              child: SizedBox(
                width: screenSize.width * 0.12,
                height: screenSize.width * 0.12, // Maintain aspect ratio for the dot
                child: AnimatedBuilder(
                  animation: controller.rotationController,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: controller.rotationController.value * 2 * 3.1416,
                      child: child,
                    );
                  },
                  child: Image.asset("assets/circular_dot.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}