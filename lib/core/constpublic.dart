import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstPublic {
  static TextStyle get titleFontStyle => GoogleFonts.roboto(
      color: Colors.black.withOpacity(0.9), fontSize: 45, fontWeight: FontWeight.w500);
  static TextStyle get buttonFontStyle => GoogleFonts.roboto(
      fontSize: 27, fontWeight: FontWeight.w700, color: Colors.blue);
  static TextStyle get buttonOtherStyle => GoogleFonts.roboto(
      fontSize: 18,
      color: Colors.white);
  static TextStyle get inputTextFormField => GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold
  );
}
