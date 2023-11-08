import 'package:flutter/material.dart';

// Const variables
const double footerTextSize = 16.0;
const double bodyTextSize = 18.0;
const double headingTextSize = 28.0;
const double titleTextSize = 36.0;
const double appbarTextSize = 48.0;
const double bulletPointSize = 18.0;
const double appbarHeight = 120.0;
const Color textColor = Colors.white;
const Color frameColor = Colors.white;
const Color footerTextColor = Colors.grey;
const Color appbarTextColor = Colors.black;
const Color appbarBgColor = Colors.amber;

// Forms variables
TextStyle bodyTextStyle = const TextStyle(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.normal,
  color: textColor,
);

TextStyle boldBodyTextStyle = const TextStyle(
  fontSize: bodyTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle headingTextStyle = const TextStyle(
  fontSize: headingTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle titleTextStyle = const TextStyle(
  fontSize: titleTextSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle bulletPointStyle = const TextStyle(
  fontSize: bulletPointSize,
  height: 1.2,
  color: textColor,
);

TextStyle footerTextStyle = const TextStyle(
  fontSize: footerTextSize,
  color: footerTextColor,
);

TextStyle appbarTextStyle = const TextStyle(
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
