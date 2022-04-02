import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final textstyle = GoogleFonts.lexend();
  static TextStyle text1 = textstyle.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static TextStyle text2 = textstyle.copyWith(
    color: Colors.white,
    fontSize: 13.5,
  );
}
