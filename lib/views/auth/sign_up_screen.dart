// views/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_dialog.dart';
import '../../controller/sign_up_screen_controller.dart';
import '../../utils/app_colord.dart';
import '../../utils/app_text/app_text.dart';
import '../../utils/app_text/app_text_style.dart';
import '../../widgets/custom_text_container.dart';
import '../../widgets/custom_text_editing_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final height = screenSize.height;
    final width = screenSize.width;

    return Scaffold(
      appBar: CustomAppbar("", true, showBackButton: true),
      body: Container(
        color: AppColors.screenColors,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.025),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              CustomTextContainer(
                headText: AppText.headingText,
                titleText: AppText.descriptionText,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: height * 0.04),
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextEditingField(
                      label: AppText.emailText,
                      labelStyle: AppTextStyle.inputLabelTextStyle,
                      hintText: "Enter Your Email",
                      controller: controller.emailController,
                      isTextVisible: true,
                    ),
                    SizedBox(height: height * 0.015),
                    CustomTextEditingField(
                      label: AppText.fullName,
                      labelStyle: AppTextStyle.inputLabelTextStyle,
                      hintText: "Enter Your Full Name",
                      controller: controller.nameController,
                      isTextVisible: true,
                    ),
                    SizedBox(height: height * 0.015),
                    CustomTextEditingField(
                      label: AppText.passwordText,
                      labelStyle: AppTextStyle.inputLabelTextStyle,
                      hintText: "Enter Your Password",
                      controller: controller.passwordController,
                      isPassword: true,
                      isTextVisible: true,
                      onChanged: controller.onPasswordChanged,
                    ),
                    SizedBox(height: height * 0.02),

                    // Password Strength Indicator
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: width * 0.005),
                            height: height * 0.005,
                            color: controller.passwordStrengthLevel.value > index
                                ? Colors.lightBlue
                                : Colors.grey.shade300,
                          ),
                        );
                      })..add(
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Text(
                              controller.passwordStrengthLabel.value,
                              style: AppTextStyle.checkBoxTextStyle,
                            ),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: height * 0.01),

                    // Password Requirement Status
                    Obx(() => Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: controller.isPasswordValid.value
                              ? const Color(0xFF23AA26)
                              : Colors.red,
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: Text(
                            "At Least 8 character with a combination of letters and numbers",
                            style: GoogleFonts.inter(
                              color: controller.isPasswordValid.value
                                  ? const Color(0xFF23AA26)
                                  : Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03,
                              letterSpacing: .02,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

              SizedBox(
                width: width * 0.875,
                child: Column(
                  children: [
                    CustomButton(
                      label: "Sign Up",
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => CustomImageTextDialog(
                            imagePath: 'assets/successful_dialog.png',
                            title: 'Successfully Registered',
                            message: 'Your account has been registered successfully, now let’s enjoy our features!',
                          ),
                        );
                      },
                      borderRadius: 100,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.035,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.signIn),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.035,
                              color: AppColors.btnColor,
                            ),
                          ),
                        ),
                      ],
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
