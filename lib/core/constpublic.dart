import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class ConstPublic {
  static TextStyle get titleFontStyle => GoogleFonts.aBeeZee(
      color: Colors.blue.withOpacity(0.9), fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle get buttonFontStyle => TextStyle(
      fontSize: 27, fontWeight: FontWeight.w700, color: Colors.blue);
  static TextStyle get buttonOtherStyle => TextStyle(
      fontSize: 18,
      color: Colors.white);
  static TextStyle get inputTextFormField => TextStyle(
    color: Colors.blue.withOpacity(0.9),
    fontSize: 12,
    fontWeight: FontWeight.bold
  );
}
