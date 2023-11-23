import 'package:flutter/material.dart';
import 'package:finance/config/styles.dart';
import 'package:finance/models/budget_rule.dart';
import 'package:finance/models/custom_widgets.dart';

class WebLayout extends StatefulWidget {
  const WebLayout({Key? key}) : super(key: key);

  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: WebAppBar(),
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [
                    Colors.black26,
                    Color.fromARGB(250, 45, 25, 50),
                  ],
                  stops: [0.0, 0.7 + 0.3 * _controller.value],
                ),
              ),
              child: child,
            );
          },
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: ListView(
                children: [
                  sectionToSectionBox,
                  SectionTitle(titleText: 'Kalkulator budżetowy'),
                  sectionToSectionBox,
                  Row(
                    children: [
                      Expanded(
                        child: BuildCardWidget(
                          child: const BudgetingCalculationForm(),
                          margin: const EdgeInsets.only(left: 16, right: 8),
                        ),
                      ),
                      Expanded(
                        child: BuildCardWidget(
                          child: const BudgetingCalculationResult(),
                          margin: const EdgeInsets.only(left: 8, right: 16),
                        ),
                      ),
                    ],
                  ),
                  sectionToSectionBox,
                  SectionTitle(
                      titleText:
                          'Reguły budżetowania - czym są i jak działają?'),
                  sectionToSectionBox,
                  for (var rule in budgetRules) budgetRuleText(rule),
                  sectionToSectionBox,
                  CopyrightFooter(),
                  toFooterBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
