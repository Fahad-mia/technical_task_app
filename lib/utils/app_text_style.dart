import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  static TextStyle textStyleFigTree700Bold = GoogleFonts.figtree(
    fontWeight: FontWeight.bold,
    color: Color(0xFF2D2D2D),
    fontSize: 22,
  );
  static TextStyle textStyleInter400Regular = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.4,
    color: Color(0xFF636F85)
  );
}