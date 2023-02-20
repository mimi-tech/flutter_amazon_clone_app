import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/dimen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
final fontFamily = GoogleFonts.oxanium();
final secondaryFontFamily = GoogleFonts.berkshireSwash().toString();

const _fontColor = kBlackColor;

final kHeadLine1Style = TextStyle(
  fontSize: kFontSize24.sp,
  fontWeight: FontWeight.bold,
  color: _fontColor,
);

final kHeadLine2Style = TextStyle(
  fontSize: kFontSize18.sp,
  fontWeight: FontWeight.bold,
  color: _fontColor,
);

final kHeadLine4Style = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.w500,
  color: _fontColor,
);

final kHeadLine5Style = TextStyle(
  fontSize: kFontSize24.sp,
  fontWeight: FontWeight.w500,
  color: _fontColor,
);

/// Also used for [navTitleTextStyle] CupertinoTextThemeData
final kHeadLine6Style = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.w600,
  color: _fontColor,
);

final kBodyText1Style = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.w500,
  color: _fontColor,
);

/// Also used for [textStyle] CupertinoTextThemeData
final kBodyText2Style = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.bold,
  color: kOrangeColor,
);

/// Also used for [navTitleTextStyle] CupertinoTextThemeData
final kSubTitle1Style = TextStyle(
  fontSize: kFontSize14.sp,
  fontWeight: FontWeight.w500,
  color: kTextColor,
);

final kSubTitle2Style = TextStyle(
  fontSize: kFontSize13.sp,
  fontWeight: FontWeight.w400,
  color: _fontColor,
);

final kCaptionStyle = TextStyle(
  fontSize: kFontSize12.sp,
  fontWeight: FontWeight.bold,
  color: kOrangeColor,
);

final kOverLineStyle = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.w500,
  color: kHintColor,
);

final kButtonTextStyle = TextStyle(
  fontSize: kFontSize16.sp,
  fontWeight: FontWeight.bold,
  color: kWhiteColor,

);

final kCardTheme =  CardTheme(
shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.transparent, width: 1.0),
borderRadius:  BorderRadius.circular(10.0))
);
