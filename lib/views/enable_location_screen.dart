import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/utils/app_text/app_text.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';
import 'package:technical_task_app/widgets/custom_button.dart';
import 'package:technical_task_app/widgets/custom_text_container.dart';

class EnableLocationSceen extends StatefulWidget {
  const EnableLocationSceen({super.key});

  @override
  State<EnableLocationSceen> createState() => _EnableLocationSceenState();
}

class _EnableLocationSceenState extends State<EnableLocationSceen> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppbar("Location", true),
      body: Container(
        color: AppColors.screenColors,
        child: Stack(
          children: [
            Positioned(
              left: screenSize.width * .06,
                top: screenSize.height * .28,
                width: screenSize.width * .876,
                height: screenSize.height * .464,
                child:Container(

                  child: Column(
                    children: [
                      Container(
                        width: screenSize.width * .32,
                        height: screenSize.height * .15,
                       color: Colors.white,
                        child: Image.asset("assets/map.png"),
                      ),
                      SizedBox(height: screenSize.height * .02,),
                      CustomTextContainer(headText: AppText.enableLocationHeader,
                      titleText: AppText.enableLocationDescription,
                      ),
                      SizedBox(height: screenSize.height * .02,),
                      CustomButton(label: "Enable", onPressed: (){},
                          borderRadius: 100),
                      SizedBox(height: screenSize.height * .02,),
                      TextButton(onPressed: (){
                        Get.toNamed(AppRoutes.selectLanguage);
                      }, child: Text("Skip, Not Now",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 2.2,
                            color: Color(0xFF2D2D2D)
                        ),
                      ))
                    ],
                    
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
