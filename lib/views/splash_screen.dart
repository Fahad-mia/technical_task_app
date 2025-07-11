import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text/app_text_style.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppbar("SplashScreen", true),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFFFFFFF),
        child: Stack(
          children: [
            // 🖼️ Car & Text Section
            Positioned(
              top: screenSize.height * 0.18,
              left: screenSize.width * 0.06,
              right: screenSize.width * 0.06,
              child: SizedBox(
                width: screenSize.width * 0.88,
                height: screenSize.height * 0.35,
                child: Column(
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
                      style: AppTextStyle.textStyleFigTree700Bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Text(
                      AppText.text2Normal,
                      style: AppTextStyle.textStyleInter400Regular,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // 🔁 Rotating Loader Image
            Positioned(
              top: screenSize.height * 0.78,
              left: screenSize.width * 0.44,
              child: SizedBox(
                width: screenSize.width * 0.12,
                height: screenSize.width * 0.12,
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
