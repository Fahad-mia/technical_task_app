import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/utils/app_text/app_text_style.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_checkbox.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';
import 'package:technical_task_app/widgets/custom_text_editing_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("Sign Up", true),
      body: Container(
        color: AppColors.screenColors,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Image
                    SizedBox(
                      width: screenSize.width * 0.2,
                      height: screenSize.width * 0.2,
                      child: Image.asset(
                        "assets/book.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Welcome Text
                    CustomTextContainer(
                      headText: "Welcome Back",
                      titleText:
                      "Please login first to start your Theory Test.",
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
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Field
                    CustomTextEditingField(
                      label: AppText.emailText,
                      labelStyle: AppTextStyle.inputLabelTextStyle,
                      hintText: "Enter Your Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),

                    // Password Field
                    CustomTextEditingField(
                      label: AppText.passwordText,
                      labelStyle: AppTextStyle.inputLabelTextStyle,
                      hintText: "Enter Your Password",
                      controller: passwordController,
                      isPassword: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: screenSize.width * .37,
                            height: screenSize.height * .035,
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
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppText.forgotPassword,
                          style: AppTextStyle.checkBoxTextStyle,),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenSize.width * .875,
                height: screenSize.height * 0.13,
                child: Column(
                  children: [
                    CustomButton(label: "Sign Up", onPressed: (){},
                        borderRadius: 100),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("New to Theory Test?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.3,
                          height: 1.6,
                        )
                        ),
                        TextButton(onPressed: (){},
                            child: Text("Create Account",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.btnColor,
                                  letterSpacing: 0.3,
                                  height: 1.6,
                                )
                            ),)
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
