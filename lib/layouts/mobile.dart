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
    return SelectionArea(
      child: Scaffold(
        appBar: const MobileAppBar(),
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
                mobileSectionToSectionBox,
                const MobileSectionTitle(titleText: 'Kalkulator budżetowy'),
                mobileSectionToSectionBox,
                BuildCardWidget(
                  child: const MobileBudgetingCalculationForm(),
                  margin: horizontalPadding16,
                ),
                mobileFormToFormBox,
                BuildCardWidget(
                  child: const MobileBudgetingCalculationResult(),
                  margin: horizontalPadding16,
                ),
                mobileSectionToSectionBox,
                const MobileSectionTitle(
                    titleText: 'Reguły budżetowania - czym są i jak działają?'),
                mobileSectionToSectionBox,
                for (var rule in budgetRules) mobileBudgetRuleText(rule),
                const CopyrightFooter(),
                toFooterBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
