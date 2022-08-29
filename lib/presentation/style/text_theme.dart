import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 36.sp,
    color: Colors.black,
  ),
  headline2: GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 32.sp,
    color: const Color(0xFF1C1C1E),
  ),
  subtitle1: GoogleFonts.beVietnamPro(
    // fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 25.sp,
  ),
  subtitle2: GoogleFonts.beVietnamPro(
    // fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 22.sp,
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
