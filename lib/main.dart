import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layouts/mobile.dart';
import 'layouts/web.dart';
import 'models/budget_rule.dart';
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
    final isMobile = MediaQuery.of(context).size.width < 750;
    Widget body = isMobile ? MobileLayout() : WebLayout();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: body,
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
