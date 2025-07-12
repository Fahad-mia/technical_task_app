import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/routes/app_routes.dart';

import '../../utils/app_colord.dart';
import '../../utils/app_text/app_text.dart';
import '../../utils/app_text/app_text_style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_editing_field.dart';

class ForgorPasswordScreen extends StatefulWidget {
  const ForgorPasswordScreen({super.key});

  @override
  State<ForgorPasswordScreen> createState() => _ForgorPasswordScreenState();
}

class _ForgorPasswordScreenState extends State<ForgorPasswordScreen> {
  final TextEditingController forgotPasswordController = TextEditingController();

  @override
  void dispose() {
    forgotPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    final double baseFontSizeMultiplier = screenSize.width / 375;
    final double responsiveVerticalSpacingSmall = screenSize.height * 0.02;
    final double responsiveVerticalSpacingMedium = screenSize.height * 0.04;
    final double responsiveHorizontalPadding = screenSize.width * 0.06;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: responsiveVerticalSpacingSmall),

                Container(
                  width: screenSize.width * .756,
                  child: Column(
                    children: [
                      Text(
                        AppText.forgotPassHeading,
                        style: AppTextStyle.textStyleInter700Bold.copyWith(
                          fontSize: AppTextStyle.textStyleInter700Bold.fontSize != null
                              ? AppTextStyle.textStyleInter700Bold.fontSize! * baseFontSizeMultiplier
                              : 28 * baseFontSizeMultiplier,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppText.forgotPassDescription,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleInter400OnBoardRegular.copyWith(
                            fontSize: AppTextStyle.textStyleInter400OnBoardRegular.fontSize != null
                                ? AppTextStyle.textStyleInter400OnBoardRegular.fontSize! * baseFontSizeMultiplier
                                : 16 * baseFontSizeMultiplier,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveVerticalSpacingMedium),

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
                        label: AppText.emailText,
                        labelStyle: AppTextStyle.inputLabelTextStyle.copyWith(
                          fontSize: AppTextStyle.inputLabelTextStyle.fontSize != null
                              ? AppTextStyle.inputLabelTextStyle.fontSize! * baseFontSizeMultiplier
                              : 14 * baseFontSizeMultiplier,
                        ),
                        hintText: "Enter Your Email",
                        controller: forgotPasswordController,
                        isTextVisible: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveVerticalSpacingMedium),

                CustomButton(
                  label: "Continue",
                  onPressed: () {
                    Get.toNamed(AppRoutes.resetPass);
                  },
                  borderRadius: 100,
                ),
                SizedBox(height: responsiveVerticalSpacingMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}