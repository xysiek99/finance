import 'package:flutter/material.dart';
import 'budget_rule.dart';

Widget budgetRuleText(BudgetRule rule) {
  List<String> percentageStrings = rule.percentage
      .map((item) => '${(item * 100).toStringAsFixed(0)}% ')
      .toList();
  List<Widget> labelWidgets = [];
  for (int i = 0; i < rule.labels.length; i++) {
    String labelPercentage = percentageStrings[i];
    String label = rule.labels[i];
    String labelDescription = rule.labelsDescription[i];
    labelWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "• ",
              style: TextStyle(
                fontSize: 18,
                height: 1.2,
              ),
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$labelPercentage - $label ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: labelDescription,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> prosWidgets = rule.pros
      .map((pro) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
                Expanded(
                  child: Text(
                    pro,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ))
      .toList();

  List<Widget> consWidgets = rule.cons
      .map((con) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
                Expanded(
                  child: Text(
                    con,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ))
      .toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text(
          rule.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          rule.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(height: 10),
      ...labelWidgets,
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          'Zalety reguły:',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ...prosWidgets,
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Text(
          'Wady reguły:',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ...consWidgets,
      const SizedBox(height: 30),
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
            "Finansoholicy",
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
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text(
          titleText,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
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
    this.copyrightText = 'Copyright © 2023 | Finansoholicy',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        copyrightText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
