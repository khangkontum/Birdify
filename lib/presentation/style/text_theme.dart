import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 32.sp,
    color: const Color(0xFF1C1C1E),
  ),
  bodyText1: GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
  ),
  bodyText2: GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.all(10.h),
  border: InputBorder.none,
  hintStyle: textTheme.bodyText1?.copyWith(
    color: const Color(0xFFAFB1B6),
  ),
);
