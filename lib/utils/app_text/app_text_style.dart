import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colord.dart';

class AppTextStyle{
  static TextStyle textStyleFigTree700Bold = GoogleFonts.figtree(
    fontWeight: FontWeight.bold,
    color: AppColors.textBoldColor,
    fontSize: 22,
  );
  static TextStyle textStyleInter400Regular = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.4,
    color: Color(0xFF636F85)
  );
  //----------onboard screen text-------
static TextStyle textStyleInter700Bold = GoogleFonts.inter(
  fontSize: 24,
  height: 1.4,
  color: AppColors.textBoldColor,
  fontWeight: FontWeight.bold,
);
  static TextStyle textStyleInter400OnBoardRegular = GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      height: 1.4,
      letterSpacing: 0.003,
      color: Color(0xFF636F85)
  );



}