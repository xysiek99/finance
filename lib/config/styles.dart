import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ------------------------ FONT SIZES ------------------------ //
const double bodyTextSize = 16.0;
const double bulletPointSize = 16.0;
const double footerTextSize = 14.0;
const double headingTextSize = 28.0;
const double titleTextSize = 36.0;
const double appBarTextSize = 48.0;

// Mobile specific font sizes
const double mobileTitleTextSize = 30.0;
const double mobileHeadingTextSize = 24.0;
const double mobileAppBarTextSize = 38.0;

// ------------------------ COLORS ------------------------ //
const Color textColor = Colors.white;
const Color frameColor = Colors.white;
const Color footerTextColor = Colors.grey;
const Color appBarTextColor = Colors.black;
const Color appBarBgColor = Colors.amber;

// ------------------------ HEIGHTS ------------------------ //
const double mobileAppBarHeight = 60.0;
const double webAppBarHeight = 120.0;

// ------------------------ BASE STYLES ------------------------ //
TextStyle baseTextStyle = GoogleFonts.signika();

// ------------------------ TEXT STYLES ------------------------ //
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

TextStyle footerTextStyle = baseTextStyle.copyWith(
  fontSize: footerTextSize,
  color: footerTextColor,
);

TextStyle bulletPointStyle = baseTextStyle.copyWith(
  fontSize: bulletPointSize,
  height: 1.2,
  color: textColor,
);

TextStyle appBarTextStyle = baseTextStyle.copyWith(
  fontSize: appBarTextSize,
  fontWeight: FontWeight.w800,
  color: appBarTextColor,
);

// Mobile specific text styles
TextStyle mobileTitleTextStyle = baseTextStyle.copyWith(
  fontSize: mobileTitleTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle mobileHeadingTextStyle = baseTextStyle.copyWith(
  fontSize: mobileHeadingTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle mobileAppBarTextStyle = baseTextStyle.copyWith(
  fontSize: mobileAppBarTextSize,
  fontWeight: FontWeight.w800,
  color: appBarTextColor,
);

// ------------------------ PADDING ------------------------ //
const EdgeInsets horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0);
const EdgeInsets symmetricalPadding36 =
    EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0);
const EdgeInsets webAppBarPadding = EdgeInsets.symmetric(horizontal: 80.0);
const EdgeInsets mobileAppBarPadding = EdgeInsets.symmetric(horizontal: 20.0);

// ------------------------ SIZED BOXES ------------------------ //
const SizedBox textToTextBox = SizedBox(height: 10);
const SizedBox toFooterBox = SizedBox(height: 30);
const SizedBox sectionToSectionBox = SizedBox(height: 60);
const SizedBox mobileFormToFormBox = SizedBox(height: 20);
const SizedBox mobileSectionToSectionBox = SizedBox(height: 40);

// ------------------------ BORDER RADIUS ------------------------ //
const BorderRadius webAppBarBorderRadius =
    BorderRadius.vertical(bottom: Radius.circular(30));
const BorderRadius mobileAppBarBorderRadius =
    BorderRadius.vertical(bottom: Radius.circular(20));
