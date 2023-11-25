import 'package:finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'budget_rule.dart';
import 'package:finance/config/constants.dart';
import 'package:finance/config/styles.dart';
import 'package:finance/utils/helpers.dart';

// ------------------------ GENERAL WIDGETS ------------------------ //

Widget createItemizedTextRow(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                boldText,
                style: boldStyle,
              ),
              Text(
                normalText,
                style: normalStyle,
              ),
            ],
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

// ------------------------ BUDGET RULE WIDGETS ------------------------ //

Widget budgetRuleText(BudgetRule rule) {
  List<String> percentageStrings = convertPercentagesToStrings(rule.percentage);
  List<Widget> labelWidgets = List<Widget>.generate(rule.labels.length, (i) {
    return createItemizedTextRow(
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

Widget mobileBudgetRuleText(BudgetRule rule) {
  List<String> percentageStrings = convertPercentagesToStrings(rule.percentage);
  List<Widget> labelWidgets = List<Widget>.generate(rule.labels.length, (i) {
    return createItemizedTextRow(
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
          style: mobileHeadingTextStyle,
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

// ------------------------ SECTION TITLES ------------------------ //

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

class MobileSectionTitle extends StatelessWidget {
  final String titleText;

  const MobileSectionTitle({
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
          style: mobileTitleTextStyle,
        ),
      ),
    );
  }
}

// ------------------------ BUDGETING CALCULATION WIDGETS ------------------------ //

class BudgetingCalculationResult extends StatelessWidget {
  const BudgetingCalculationResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RuleModel>(
      builder: (context, ruleModel, child) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ruleModel.labels.isNotEmpty && ruleModel.values.isNotEmpty
                ? List.generate(ruleModel.labels.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: Icon(
                                  ruleModel.iconInfos[index].icon,
                                  color: ruleModel.iconInfos[index].color,
                                  size: 36,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                child: Text(
                                  ruleModel.labels[index],
                                  style: bodyTextStyle,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ruleModel.values[index],
                          style: boldBodyTextStyle,
                        ),
                      ],
                    );
                  })
                : [
                    Text(
                      'Wybierz regułę budżetowania i wprowadź swój przychód',
                      textAlign: TextAlign.center,
                      style: bodyTextStyle.copyWith(height: 2.5),
                    ),
                  ],
          ),
        );
      },
    );
  }
}

class MobileBudgetingCalculationResult extends StatelessWidget {
  const MobileBudgetingCalculationResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RuleModel>(
      builder: (context, ruleModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ruleModel.labels.isNotEmpty && ruleModel.values.isNotEmpty
                ? List.generate(ruleModel.labels.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: Icon(
                                  ruleModel.iconInfos[index].icon,
                                  color: ruleModel.iconInfos[index].color,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  ruleModel.labels[index],
                                  style: bodyTextStyle,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        Text(
                          ruleModel.values[index],
                          style: boldBodyTextStyle,
                        ),
                      ],
                    );
                  })
                : [
                    Text(
                      'Wybierz regułę budżetowania i wprowadź swój przychód',
                      textAlign: TextAlign.center,
                      style: bodyTextStyle.copyWith(height: 2.5),
                    ),
                  ],
          ),
        );
      },
    );
  }
}

class BudgetingCalculationForm extends StatefulWidget {
  const BudgetingCalculationForm({Key? key}) : super(key: key);

  @override
  _BudgetingCalculationFormState createState() =>
      _BudgetingCalculationFormState();
}

class _BudgetingCalculationFormState extends State<BudgetingCalculationForm> {
  String? dropdownValue;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            style: bodyTextStyle,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: frameColor),
              ),
              labelText: 'Twój przychód',
              labelStyle: bodyTextStyle,
              floatingLabelStyle: bodyTextStyle.copyWith(color: frameColor),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 2,
                    color: Colors.white24,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
            onChanged: (value) {
              context.read<RuleModel>().calculateResult(value, dropdownValue);
            },
          ),
          const SizedBox(height: 25),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            hint: Text('Reguła budżetowania', style: bodyTextStyle),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              context
                  .read<RuleModel>()
                  .calculateResult(_controller.text, newValue);
            },
            items: budgetRules.map<DropdownMenuItem<String>>((BudgetRule rule) {
              return DropdownMenuItem<String>(
                value: rule.name,
                child: Text(rule.name, style: bodyTextStyle),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MobileBudgetingCalculationForm extends StatefulWidget {
  const MobileBudgetingCalculationForm({Key? key}) : super(key: key);

  @override
  _MobileBudgetingCalculationForm createState() =>
      _MobileBudgetingCalculationForm();
}

class _MobileBudgetingCalculationForm
    extends State<MobileBudgetingCalculationForm> {
  String? dropdownValue;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            style: bodyTextStyle,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: frameColor),
              ),
              labelText: 'Twój przychód',
              labelStyle: bodyTextStyle,
              floatingLabelStyle: bodyTextStyle.copyWith(color: frameColor),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 2,
                    color: Colors.white24,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
            onChanged: (value) {
              context.read<RuleModel>().calculateResult(value, dropdownValue);
            },
          ),
          const SizedBox(height: 25),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            hint: Text('Reguła budżetowania', style: bodyTextStyle),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              context
                  .read<RuleModel>()
                  .calculateResult(_controller.text, newValue);
            },
            items: budgetRules.map<DropdownMenuItem<String>>((BudgetRule rule) {
              return DropdownMenuItem<String>(
                value: rule.name,
                child: Text(rule.name, style: bodyTextStyle),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ------------------------ CARD WIDGET ------------------------ //

Widget BuildCardWidget(
    {required Widget child,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 8)}) {
  return Container(
    height: 225,
    margin: margin,
    decoration: BoxDecoration(
      border: Border.all(color: frameColor, width: 0.7),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(child: child),
  );
}

// ------------------------ FOOTER ------------------------ //

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

// ------------------------ APPBAR WIDGETS ------------------------ //

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  WebAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(webAppBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: webAppBarBorderRadius,
      child: AppBar(
        title: Padding(
          padding: webAppBarPadding,
          child: Text(
            pageTitle,
            style: appBarTextStyle,
          ),
        ),
        backgroundColor: appBarBgColor,
        toolbarHeight: webAppBarHeight,
        shape: RoundedRectangleBorder(
          borderRadius: webAppBarBorderRadius,
        ),
      ),
    );
  }
}

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  MobileAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(mobileAppBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: mobileAppBarBorderRadius,
      child: AppBar(
        centerTitle: true,
        title: Padding(
          padding: mobileAppBarPadding,
          child: Text(
            pageTitle,
            style: mobileAppBarTextStyle,
          ),
        ),
        backgroundColor: appBarBgColor,
        toolbarHeight: mobileAppBarHeight,
        shape: RoundedRectangleBorder(
          borderRadius: mobileAppBarBorderRadius,
        ),
      ),
    );
  }
}
