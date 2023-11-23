import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Const variables
const double footerTextSize = 14.0;
const double bodyTextSize = 16.0;
const double headingTextSize = 28.0;
const double titleTextSize = 36.0;
const double appbarTextSize = 48.0;
const double bulletPointSize = 16.0;
const double appbarHeight = 120.0;
const Color textColor = Colors.white;
const Color frameColor = Colors.white;
const Color footerTextColor = Colors.grey;
const Color appbarTextColor = Colors.black;
const Color appbarBgColor = Colors.amber;

// TextStyles variables
TextStyle baseTextStyle = GoogleFonts.signika();

// TextStyles variables
TextStyle bodyTextStyle = baseTextStyle.copyWith(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.normal,
  color: textColor,
);

TextStyle boldBodyTextStyle = baseTextStyle.copyWith(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle headingTextStyle = baseTextStyle.copyWith(
  fontSize: headingTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle titleTextStyle = baseTextStyle.copyWith(
  fontSize: titleTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle bulletPointStyle = baseTextStyle.copyWith(
  fontSize: bulletPointSize,
  height: 1.2,
  color: textColor,
);

TextStyle footerTextStyle = baseTextStyle.copyWith(
  fontSize: footerTextSize,
  color: footerTextColor,
);

TextStyle appbarTextStyle = baseTextStyle.copyWith(
  fontSize: appbarTextSize,
  fontWeight: FontWeight.w800,
  color: appbarTextColor,
);

// Paddings
const EdgeInsets horizontalPadding16 = EdgeInsets.only(left: 16.0, right: 16.0);
const EdgeInsets symmetricalPadding36 =
    EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0);
const EdgeInsets webAppBarPadding = EdgeInsets.only(left: 80, right: 80);
const EdgeInsets mobileAppBarPadding = EdgeInsets.only(left: 40, right: 40);

// SizedBoxes
SizedBox textToTextBox = const SizedBox(height: 10);
SizedBox toFooterBox = const SizedBox(height: 30);
SizedBox sectionToSectionBox = const SizedBox(height: 60);

// BorderRadius
const BorderRadius appBarBorderRadius =
    BorderRadius.vertical(bottom: Radius.circular(30));
