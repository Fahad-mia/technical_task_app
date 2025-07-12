import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/select_language_screen_controller.dart';
import '../utils/app_colord.dart';
import '../utils/app_text/app_text.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  final List<Country> countries = CountryService().getAll();

  final SelectLanguageScreenController controller = Get.put(
    SelectLanguageScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppbar("", true, showBackButton: true),
      body: Container(
        color: AppColors.screenColors,
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              AppText.motherLanguageHeading,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: screenSize.width * 0.05,
                // Responsive font size
                fontWeight: FontWeight.w700,
                color: const Color(0xFF070707),
                letterSpacing: 0.005,
                height: 1.8,
              ),
            ),
            Text(
              AppText.motherLanguageDescription,
              style: GoogleFonts.inter(
                fontSize: screenSize.width * 0.035,
                // Responsive font size
                fontWeight: FontWeight.w400,
                color: const Color(0xFF636F85),
                letterSpacing: 0.005,
                height: 1.7,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenSize.width * 0.03,
                      ),
                    ),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.01,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.03,
                        vertical: screenSize.height * 0.015,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: screenSize.width * 0.06,
                            // Responsive radius
                            child: Text(
                              country.flagEmoji,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.03),
                          Expanded(
                            child: Text(
                              country.name,
                              style: GoogleFonts.inter(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Obx(() {
                            final isSelected =
                                controller.selectedIndex.value == index;
                            return CustomButton(
                              label: "Select",
                              onPressed: () {
                                controller.selectCountry(index);
                              },
                              borderRadius: 100,
                              width: screenSize.width * 0.28,
                              height: screenSize.height * 0.045,
                              backgroundColor: isSelected
                                  ? AppColors.btnColor
                                  : Colors.grey,
                              textColor: Colors.white,
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenSize.height * 0.04),
              child: CustomButton(
                label: "Continue",
                onPressed: () {},
                borderRadius: 100,
                width: screenSize.width * 0.9,
                // Make continue button responsive too
                height: screenSize.height * 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
