import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technical_task_app/routes/app_routes.dart';

import '../../utils/app_colord.dart';
import '../../utils/app_text/app_text.dart';
import '../../utils/app_text/app_text_style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_editing_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppbar("", true, showBackButton: true),
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
                        AppText.resetPassHeading,
                        style: AppTextStyle.textStyleInter700Bold,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppText.resetPassDescription,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleInter400OnBoardRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Form Container
              Container(
                width: screenSize.width * .9,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Field
                    CustomTextEditingField(
                      label: AppText.newPasswordText,
                      labelStyle: AppTextStyle.newPasswordTestStyle,
                      hintText: "Enter new Password",
                      controller: confirmNewPassword,
                      isPassword: true, isTextVisible: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextEditingField(
                      label: AppText.confirmPasswordText,
                      labelStyle: AppTextStyle.newPasswordTestStyle,
                      hintText: "Retype your Password",
                      controller: newPassword,
                      isPassword: true, isTextVisible: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: screenSize.width * .875,
                height: screenSize.height * 0.13,
                child: Column(
                  children: [
                    CustomButton(
                      label: "Submit",
                      onPressed: () {
                        Get.toNamed(AppRoutes.verifyCode);
                      },
                      borderRadius: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
