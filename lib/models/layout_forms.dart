import 'package:flutter/material.dart';
import 'budget_rule.dart';

Widget budgetRuleText(BudgetRule rule) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            rule.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Text(
            rule.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
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
          padding: const EdgeInsets.only(left: 120, right: 120),
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
