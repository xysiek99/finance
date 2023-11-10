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

// Forms variables
TextStyle bodyTextStyle = GoogleFonts.signika(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.normal,
  color: textColor,
);

TextStyle boldBodyTextStyle = GoogleFonts.signika(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle headingTextStyle = GoogleFonts.signika(
  fontSize: headingTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle titleTextStyle = GoogleFonts.signika(
  fontSize: titleTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle bulletPointStyle = GoogleFonts.signika(
  fontSize: bulletPointSize,
  height: 1.2,
  color: textColor,
);

TextStyle footerTextStyle = GoogleFonts.signika(
  fontSize: footerTextSize,
  color: footerTextColor,
);

TextStyle appbarTextStyle = GoogleFonts.signika(
  fontSize: appbarTextSize,
  fontWeight: FontWeight.w800,
  color: appbarTextColor,
);

// Paddings
const EdgeInsets horizontalPadding16 = EdgeInsets.only(left: 16.0, right: 16.0);
const EdgeInsets symmetricalPadding36 =
    EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0);
const EdgeInsets appBarPadding160 = EdgeInsets.only(left: 160, right: 160);

// SizedBoxes
SizedBox textToTextBox = const SizedBox(height: 10);
SizedBox toFooterBox = const SizedBox(height: 30);
SizedBox sectionToSectionBox = const SizedBox(height: 60);

// BorderRadius
const BorderRadius appbarBorderRadius =
    BorderRadius.vertical(bottom: Radius.circular(30));
