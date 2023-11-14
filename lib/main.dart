import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/custom_widgets.dart';
import 'models/budget_rule.dart';
import 'config/styles.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RuleModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SelectionArea(
        child: Scaffold(
          appBar: CustomAppBar(),
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
      ),
    );
  }
}

class RuleModel extends ChangeNotifier {
  List<String> labels = [];
  List<String> values = [];
  List<IconInfo> iconInfos = [];

  void calculateResult(String income, String? ruleName) {
    labels.clear();
    values.clear();
    iconInfos.clear();

    if (income.isNotEmpty && ruleName != null) {
      double incomeDouble = double.tryParse(income) ?? 0;

      BudgetRule? rule =
          budgetRules.firstWhereOrNull((r) => r.name == ruleName);

      if (rule != null) {
        labels = List.from(rule.labels);
        iconInfos = List.from(rule.iconInfos);

        values = rule.percentage.map((percentage) {
          return '${(incomeDouble * percentage).toStringAsFixed(2)} \$';
        }).toList();
      }
    }

    notifyListeners();
  }
}
