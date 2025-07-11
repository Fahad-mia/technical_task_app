import 'package:flutter/material.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("Login", true),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Image
                    SizedBox(
                      width: screenSize.width * 0.2,
                      height: screenSize.width * 0.2,
                      child: Image.asset("assets/book.png", fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 16),

                    // Welcome text
                    CustomTextContainer(
                      headText: "Welcome Back",
                      titleText: "Please login first to start your Theory Test.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Form fields would go here...
              // Example: Full name field, password field, etc.
            ],
          ),
        ),
      ),
    );
  }
}
