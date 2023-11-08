import 'package:flutter/material.dart';
import 'budget_rule.dart';

// Data variables
const String pageTitle = 'Finansoholicy';
const String copyrightLabel = 'Copyright © 2023 | $pageTitle';

// Const variables
const double footerTextSize = 16.0;
const double bodyTextSize = 18.0;
const double headingTextSize = 28.0;
const double titleTextSize = 36.0;
const double bulletPointSize = 18.0;
const Color textColor = Colors.white;
const Color footerTextColor = Colors.grey;

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

// Paddings
const EdgeInsets horizontalPadding16 = EdgeInsets.only(left: 16.0, right: 16.0);
const EdgeInsets symmetricalPadding36 =
    EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0);

// Helper functions
List<String> convertPercentagesToStrings(List<double> percentages) {
  return percentages
      .map((item) => '${(item * 100).toStringAsFixed(0)}% ')
      .toList();
}

// SizedBoxes
SizedBox textToTextBox = const SizedBox(height: 10);
SizedBox toFooterBox = const SizedBox(height: 30);

// Widgets
Widget createItemizedRichRow(
    String leadingSymbol,
    String boldText,
    String normalText,
    TextStyle leadingStyle,
    TextStyle boldStyle,
    TextStyle normalStyle) {
  return Padding(
    padding: symmetricalPadding36,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leadingSymbol,
          style: leadingStyle,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: boldText,
                  style: boldStyle,
                ),
                TextSpan(
                  text: normalText,
                  style: normalStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget createSimpleItemizedRow(
    String leadingSymbol, String text, TextStyle textStyle) {
  return Padding(
    padding: symmetricalPadding36,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leadingSymbol,
          style: bulletPointStyle,
        ),
        Expanded(
          child: Text(text, style: textStyle),
        ),
      ],
    ),
  );
}

Widget budgetRuleText(BudgetRule rule) {
  List<String> percentageStrings = convertPercentagesToStrings(rule.percentage);
  List<Widget> labelWidgets = List<Widget>.generate(rule.labels.length, (i) {
    return createItemizedRichRow(
      "• ",
      "${percentageStrings[i]} - ${rule.labels[i]} ",
      rule.labelsDescription[i],
      bulletPointStyle,
      boldBodyTextStyle,
      bodyTextStyle,
    );
  });

  List<Widget> prosWidgets = rule.pros
      .map((pro) => createSimpleItemizedRow("• ", pro, bodyTextStyle))
      .toList();

  List<Widget> consWidgets = rule.cons
      .map((con) => createSimpleItemizedRow("• ", con, bodyTextStyle))
      .toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: horizontalPadding16,
        child: Text(
          rule.name,
          style: headingTextStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          rule.description,
          textAlign: TextAlign.justify,
          style: bodyTextStyle,
        ),
      ),
      textToTextBox,
      ...labelWidgets,
      textToTextBox,
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          'Zalety reguły:',
          textAlign: TextAlign.justify,
          style: boldBodyTextStyle,
        ),
      ),
      ...prosWidgets,
      textToTextBox,
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          'Wady reguły:',
          textAlign: TextAlign.justify,
          style: boldBodyTextStyle,
        ),
      ),
      ...consWidgets,
      toFooterBox,
    ],
  );
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(120.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      child: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 160, right: 160),
          child: Text(
            pageTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        backgroundColor: Colors.amber,
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String titleText;

  const SectionTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: horizontalPadding16,
        child: Text(
          titleText,
          style: titleTextStyle,
        ),
      ),
    );
  }
}

Widget BuildCardWidget(
    {required Widget child,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 8)}) {
  return Container(
    height: 225,
    margin: margin,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 0.7),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(child: child),
  );
}

class CopyrightFooter extends StatelessWidget {
  final String copyrightText;

  const CopyrightFooter({
    Key? key,
    this.copyrightText = copyrightLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        copyrightText,
        textAlign: TextAlign.center,
        style: footerTextStyle,
      ),
    );
  }
}
