import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text_style.dart';
import 'package:technical_task_app/utils/utils.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final size = Utils.screenSize(context);
    return Scaffold(
      appBar: CustomAppbar("SplashScreen", true),
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: Stack(
          children: [
            Positioned(
              top: size.height * .185,
              child: Padding(
                padding: const EdgeInsets.all(19),
                child: SizedBox(
                  width: size.width * .88,
                  height: size.height * .323,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width * .32,
                        height: size.height * .141,
                        child: Center(child: Image.asset("assets/car.png")),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppText.text1Bold,
                              style: AppTextStyle.textStyleFigTree700Bold,
                            ),
                            Expanded(
                              child: Text(
                                AppText.text2Normal,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleInter400Regular,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 🔁 Rotating Image
            Positioned(
              top: size.height * 0.78,
              left: size.width * 0.44,
              width: size.width * 0.124,
              height: size.height * 0.06,
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
          ],
        ),
      ),
    );
  }
}
