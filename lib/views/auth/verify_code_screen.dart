import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_dialog.dart';

import '../../controller/verify_code_screen_controller.dart';
import '../../utils/app_colord.dart';
import '../../utils/app_text/app_text.dart';
import '../../utils/app_text/app_text_style.dart';
import '../../widgets/custom_appbar.dart';

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
      body: Container(
        color: AppColors.screenColors,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                width: screenSize.width * .756,
                height: screenSize.height * .15,
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
              const SizedBox(height: 30),
              OTPInputBox(controller: verifyController.otpTextController),
              SizedBox(height: screenSize.height * .12),

              // 🔥 Timer Text using GetX
              Obx(() => Text(AppText.timerText +
                verifyController.formattedTime,
                style: AppTextStyle.textStyleInter400OnBoardRegular,
              )),

              SizedBox(height: screenSize.height * .1),
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
  }
}


// OTP Input Widget
class OTPInputBox extends StatefulWidget {
  final TextEditingController controller;
  const OTPInputBox({super.key, required this.controller});

  @override
  State<OTPInputBox> createState() => _OTPInputBoxState();
}

class _OTPInputBoxState extends State<OTPInputBox> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: Stack(
        children: [
          // Hidden input field
          Opacity(
            opacity: 0,
            child: TextField(
              focusNode: focusNode,
              controller: widget.controller,
              keyboardType: TextInputType.number,
              maxLength: 4,
              autofocus: true,
              onChanged: (_) => setState(() {}),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              String char = "";
              if (widget.controller.text.length > index) {
                char = widget.controller.text[index];
              }
              return Container(
                width: 56,
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Text(
                  char,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
