import 'package:flutter/material.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text_style.dart';
import 'package:technical_task_app/utils/utils.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = Utils.screenSize(context);
    return Scaffold(
      appBar: CustomAppbar("SplashScreen", true),
      body: Container(
        color: Color(0xFFFFFFFF),
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
                        child: Container(
                          width: double.infinity,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.78,
              left: size.width * 0.44,
              width: size.width * 0.124,
              height: size.height * 0.06,
              child: Container(child: Image.asset("assets/circular_dot.png")),
            ),
          ],
        ),
      ),
    );
  }
}
