import 'package:flutter/material.dart';
import 'package:finance/config/styles.dart';
import 'package:finance/models/budget_rule.dart';
import 'package:finance/models/custom_widgets.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
    with TickerProviderStateMixin {
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
    return Scaffold(
      appBar: MobileAppBar(),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              sectionToSectionBox,
              SectionTitle(titleText: 'Kalkulator budżetowy'),
              sectionToSectionBox,
              BuildCardWidget(
                child: const BudgetingCalculationForm(),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
              ),
              BuildCardWidget(
                child: const BudgetingCalculationResult(),
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 16),
              ),
              sectionToSectionBox,
              SectionTitle(
                  titleText: 'Reguły budżetowania - czym są i jak działają?'),
              sectionToSectionBox,
              for (var rule in budgetRules) budgetRuleText(rule),
              sectionToSectionBox,
              CopyrightFooter(),
              toFooterBox,
            ],
          ),
        ),
      ),
    );
  }
}
