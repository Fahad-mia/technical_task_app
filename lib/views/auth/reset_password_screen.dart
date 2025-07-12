import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final TextEditingController newPasswordController = TextEditingController(); // Renamed for clarity
  final TextEditingController confirmNewPasswordController = TextEditingController(); // Renamed for clarity

  @override
  void dispose() {
    newPasswordController.dispose(); // Dispose controllers to prevent memory leaks
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    // Responsive constants
    final double baseFontSizeMultiplier = screenSize.width / 375; // Reference width for font scaling
    final double responsiveVerticalSpacingSmall = screenSize.height * 0.02; // ~16px on 800px height
    final double responsiveVerticalSpacingMedium = screenSize.height * 0.04; // ~32px on 800px height
    final double responsiveHorizontalPadding = screenSize.width * 0.06; // ~25px on 400px width

    return Scaffold(
      appBar: CustomAppbar("", true, showBackButton: true),
      body: SafeArea(
        child: Container(
          color: AppColors.screenColors,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveHorizontalPadding,
              vertical: responsiveVerticalSpacingMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
              children: [
                SizedBox(height: responsiveVerticalSpacingSmall),

                // Header and Description Container
                Container(
                  width: screenSize.width * .756,
                  // Removed fixed height. Let the content determine the height.
                  child: Column(
                    children: [
                      Text(
                        AppText.resetPassHeading,
                        style: AppTextStyle.textStyleInter700Bold.copyWith(
                          fontSize: AppTextStyle.textStyleInter700Bold.fontSize != null
                              ? AppTextStyle.textStyleInter700Bold.fontSize! * baseFontSizeMultiplier
                              : 28 * baseFontSizeMultiplier, // Fallback if fontSize is null
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppText.resetPassDescription,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleInter400OnBoardRegular.copyWith(
                            fontSize: AppTextStyle.textStyleInter400OnBoardRegular.fontSize != null
                                ? AppTextStyle.textStyleInter400OnBoardRegular.fontSize! * baseFontSizeMultiplier
                                : 16 * baseFontSizeMultiplier, // Fallback
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveVerticalSpacingMedium),

                // Form Container (New Password & Confirm Password Fields)
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
                      CustomTextEditingField(
                        label: AppText.newPasswordText,
                        labelStyle: AppTextStyle.newPasswordTestStyle.copyWith( // Assuming newPasswordTestStyle can scale
                          fontSize: AppTextStyle.newPasswordTestStyle.fontSize != null
                              ? AppTextStyle.newPasswordTestStyle.fontSize! * baseFontSizeMultiplier
                              : 14 * baseFontSizeMultiplier, // Fallback
                        ),
                        hintText: "Enter new Password",
                        controller: newPasswordController,
                        isPassword: true,
                        isTextVisible: true,
                      ),
                      SizedBox(height: responsiveVerticalSpacingSmall), // Responsive spacing between fields
                      CustomTextEditingField(
                        label: AppText.confirmPasswordText,
                        labelStyle: AppTextStyle.newPasswordTestStyle.copyWith( // Assuming newPasswordTestStyle can scale
                          fontSize: AppTextStyle.newPasswordTestStyle.fontSize != null
                              ? AppTextStyle.newPasswordTestStyle.fontSize! * baseFontSizeMultiplier
                              : 14 * baseFontSizeMultiplier, // Fallback
                        ),
                        hintText: "Retype your Password",
                        controller: confirmNewPasswordController,
                        isPassword: true,
                        isTextVisible: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveVerticalSpacingMedium),

                // Submit Button
                CustomButton(
                  label: "Submit",
                  onPressed: () {
                    Get.toNamed(AppRoutes.verifyCode);
                  },
                  borderRadius: 100,
                ),
                SizedBox(height: responsiveVerticalSpacingMedium), // Add some space at the very bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}