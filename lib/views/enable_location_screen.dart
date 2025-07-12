import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';

import '../widgets/custom_button.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.sizeOf(context) is already responsive, but we need to
    // use it more effectively with flexible widgets.
    final Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("", true, showBackButton: true),
      body: Container(
        color: AppColors.screenColors,
        // Using a Column here allows the content to stack vertically and
        // automatically handle available space, making it responsive.
        // Center the content both horizontally and vertically.
        child: Center(
          child: SingleChildScrollView( // Added SingleChildScrollView for smaller screens
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.06, // Responsive horizontal padding
              vertical: screenSize.height * 0.05, // Responsive vertical padding
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically within available space
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                // Image Container
                Container(
                  // Use a fixed size for the image if it's an icon-like image,
                  // or use aspect ratio if it's a content image.
                  // For an icon, a responsive size based on screen width can work.
                  width: screenSize.width * 0.32, // Still scaled, but now the parent column helps
                  height: screenSize.width * 0.32 * (150/150), // Maintain aspect ratio if it's a square image
                  // You might consider a fixed size like 150.0 if the image is an icon
                  // width: 150.0,
                  // height: 150.0,
                  color: Colors.white, // This white background might be around the image
                  child: Image.asset(
                    "assets/map.png",
                    fit: BoxFit.contain, // Ensure the image fits within the box
                  ),
                ),
                SizedBox(height: screenSize.height * .02), // Responsive vertical spacing
                CustomTextContainer(
                  headText: AppText.enableLocationHeader,
                  titleText: AppText.enableLocationDescription,
                ),
                SizedBox(height: screenSize.height * .02), // Responsive vertical spacing
                CustomButton(
                  label: "Enable",
                  onPressed: () {},
                  borderRadius: 100,
                ),
                SizedBox(height: screenSize.height * .02), // Responsive vertical spacing
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.selectLanguage);
                  },
                  child: Text(
                    "Skip, Not Now",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      // Scale font size based on screen width for better responsiveness
                      fontSize: 16 * (screenSize.width / 375), // Assuming 375 is a base width (e.g., iPhone 8)
                      height: 2.2,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}