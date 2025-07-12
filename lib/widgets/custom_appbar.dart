import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar CustomAppbar(
    String title,
    bool centerTitle, {
      bool showBackButton = false,
      VoidCallback? onBackPressed,
      Widget? leading,
      List<Widget?>? actionIcon,
      Color backgroundColor = Colors.white,
    }) {
  final screenWidth = Get.width;

  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false, // Always hide default back icon
    leading: leading ??
        (showBackButton
            ? GestureDetector(
          onTap: onBackPressed ?? () => Get.back(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios_new,
                    size: screenWidth * 0.05, color: Colors.black),
              ],
            ),
          ),
        )
            : null),
    title: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: screenWidth * 0.05,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    actions: actionIcon?.whereType<Widget>().toList(),
  );
}
