// verify_code_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_dialog.dart';

import '../../controller/verify_code_screen_controller.dart';
import '../../utils/app_colord.dart';
import '../../utils/app_text/app_text.dart';
import '../../utils/app_text/app_text_style.dart';
import '../../widgets/custom_appbar.dart';
import 'otp_input_box.dart';  // import OTP widget here

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final VerifyScreenController verifyController = Get.put(VerifyScreenController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar(
        "",
        true,
        showBackButton: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Center
                (
                child: ConstrainedBox(

                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: maxHeight * 0.02),

                      Container(

                        width: screenSize.width * 0.756,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                AppText.verifyCodeHeader,
                                style: AppTextStyle.textStyleInter700Bold,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppText.verifyCodeDescription,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textStyleInter400OnBoardRegular,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: maxHeight * 0.04),

                      OTPInputBox(controller: verifyController.otpTextController),

                      SizedBox(height: maxHeight * 0.05),

                      Obx(() => Text(
                        AppText.timerText + verifyController.formattedTime,
                        style: AppTextStyle.textStyleInter400OnBoardRegular,
                      )),

                      SizedBox(height: maxHeight * 0.06),

                      CustomButton(
                        label: "Verify",
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => CustomImageTextDialog(
                              imagePath: 'assets/verify_success.png',
                              title: 'Success!',
                              message: 'Your operation was completed successfully.',
                            ),
                          );
                        },
                        borderRadius: 100,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
