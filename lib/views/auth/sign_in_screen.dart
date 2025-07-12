import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text/app_text_style.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_checkbox.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';
import 'package:technical_task_app/widgets/custom_text_editing_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("Sign In", true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = screenSize.width < 600 ? 20 : 100;

          return Container(
            color: AppColors.screenColors,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
              child: Column(
                children: [
                  // Top Logo & Welcome Text
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.25,
                        height: screenSize.width * 0.25,
                        child: Image.asset(
                          "assets/book.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextContainer(
                        headText: "Welcome Back",
                        titleText: "Please login first to start your Theory Test.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Form Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextEditingField(
                          label: AppText.emailText,
                          labelStyle: AppTextStyle.inputLabelTextStyle,
                          hintText: "Enter Your Email",
                          controller: emailController,
                          isTextVisible: true,
                        ),
                        const SizedBox(height: 12),
                        CustomTextEditingField(
                          label: AppText.passwordText,
                          labelStyle: AppTextStyle.inputLabelTextStyle,
                          hintText: "Enter Your Password",
                          controller: passwordController,
                          isPassword: true,
                          keyboardType: TextInputType.text,
                          isTextVisible: true,
                        ),
                        const SizedBox(height: 20),

                        // Remember Me + Forgot Password
                        // Remember Me + Forgot Password (One Line)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: CustomCheckbox(
                                value: _isChecked,
                                label: AppText.rememberMe,
                                labelStyle: AppTextStyle.checkBoxTextStyle,
                                onChanged: (newValue) {
                                  setState(() {
                                    _isChecked = newValue ?? false;
                                  });
                                },
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.forgotPass);
                              },
                              child: Text(
                                AppText.forgotPassword,
                                style: AppTextStyle.checkBoxTextStyle,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Sign In Button + Create Account
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        CustomButton(
                          label: "Sign In",
                          onPressed: () {
                            Get.toNamed(AppRoutes.enableLocation);
                          },
                          borderRadius: 100,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New to Theory Test?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                height: 1.6,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.signUp);
                              },
                              child: Text(
                                "Create Account",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.btnColor,
                                  letterSpacing: 0.3,
                                  height: 1.6,
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
          );
        },
      ),
    );
  }
}
