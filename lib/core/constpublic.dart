import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstPublic {
  static TextStyle get titleFontStyle => GoogleFonts.poppins(
      color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold);
  static TextStyle get buttonFontStyle => GoogleFonts.poppins(
      fontSize: 27, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle get buttonOtherStyle => GoogleFonts.poppins(
      decoration: TextDecoration.underline,
      fontSize: 18,
      color: Colors.black87);
  static TextStyle get inputTextFormField => GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400
  );
}
