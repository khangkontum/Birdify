import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    backgroundColor: const Color(0xFFFF97B7),
    textTheme: TextTheme(
        headline1: GoogleFonts.beVietnamPro(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: const Color(0xFF1C1C1E) // ExtraBold
            ),
        bodyText1: GoogleFonts.beVietnamPro(
          fontWeight: FontWeight.normal,
          fontSize: 18,
        )),
  );
}
