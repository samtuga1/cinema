import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final textstyle = GoogleFonts.lexend();
  static TextStyle text1 = textstyle.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle text2 = textstyle.copyWith(
    color: Colors.white,
    fontSize: 13.5,
  );
}
