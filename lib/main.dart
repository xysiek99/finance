import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/layout_forms.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
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
                  const SizedBox(height: 60),
                  SectionTitle(titleText: 'Budgeting calculator'),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      Expanded(
                        child: BuildCardWidget(
                          child: const MyForm(),
                          margin: const EdgeInsets.only(left: 16, right: 8),
                        ),
                      ),
                      Expanded(
                        child: BuildCardWidget(
                          child: const MyTextWidget(),
                          margin: const EdgeInsets.only(left: 8, right: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  SectionTitle(
                      titleText:
                          'Budgeting rules - what they are and how do they work?'),
                  SizedBox(height: 60),
                  for (var rule in budgetRules) budgetRuleText(rule),
                  SizedBox(height: 60),
                  CopyrightFooter(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
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
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Enter your income',
              labelStyle: const TextStyle(fontSize: 18),
              floatingLabelStyle: TextStyle(fontSize: 18, color: Colors.white),
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
            hint: const Text('Budgeting Rule', style: TextStyle(fontSize: 18)),
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
                child: Text(rule.name, style: const TextStyle(fontSize: 18)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

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
                        Row(
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
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                ruleModel.labels[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            ruleModel.values[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                : [
                    const Text(
                      'Please choose a budgeting rule and enter your income',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        height: 2.5,
                      ),
                    ),
                  ],
          ),
        );
      },
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
