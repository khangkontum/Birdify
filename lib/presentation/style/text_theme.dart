import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = TextTheme(
    headline1: GoogleFonts.beVietnamPro(
      fontWeight: FontWeight.w800, // ExtraBold
      fontSize: 32,
      color: const Color(0xFF1C1C1E),
    ),
    bodyText1: GoogleFonts.beVietnamPro(
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ));

final inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.all(10),
  border: InputBorder.none,
  hintStyle: textTheme.bodyText1?.copyWith(
    color: const Color(0xFFAFB1B6),
  ),
);
