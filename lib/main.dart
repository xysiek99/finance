import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/icon_info.dart';
import 'models/layout_forms.dart';

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
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [
                    Colors.blue,
                    Colors.green,
                  ],
                  stops: [0.0, 0.7 + 0.3 * _controller.value],
                ),
              ),
              child: child,
            );
          },
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    'Budgeting calculator',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 225,
                      margin: const EdgeInsets.only(left: 16, right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: MyForm(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 225,
                      margin: const EdgeInsets.only(left: 8, right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: MyTextWidget(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    'Budgeting rules - what they are and how do they work?',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              budgetRuleText(
                'Budgeting rule 70/20/10',
                'The 70/20/10 budgeting rule is a simple and effective way to manage your finances. '
                    'According to this rule, you allocate 70% of your income to essential expenses such as rent, utilities, groceries, and transportation. '
                    '20% goes towards savings and investments for your future, including retirement funds, emergency savings, or other financial goals. '
                    'The remaining 10% is designated for personal spending, allowing you to enjoy your hobbies, dining out, or other leisure activities without guilt. '
                    'By following the 70/20/10 rule, you can ensure a balanced financial life, securing your future while also enjoying the present.',
              ),
              budgetRuleText(
                'Budgeting rule 50/30/20',
                'The 50/30/20 budgeting rule is a straightforward method to divide your income. '
                    '50% of your income should be allocated to necessities like housing, groceries, and bills. '
                    '30% can be used for discretionary expenses such as entertainment, dining out, or shopping. '
                    'Finally, 20% should be saved or invested for future financial stability. '
                    'This rule is great for those who want a simple way to manage their finances while ensuring savings.',
              ),
              budgetRuleText(
                'Budgeting rule 30/30/40',
                'The 30/30/40 budgeting rule is a unique method where 30% of your income goes to savings, '
                    'another 30% is allocated for discretionary spending, and the remaining 40% is used for essential expenses.'
                    'This approach encourages a strong savings habit while still allowing for flexibility in discretionary spending.'
                    'It is a great option for those who want to balance saving money with enjoying their lifestyle.',
              ),
              budgetRuleText(
                'Budgeting rule 80/20',
                'The 80/20 budgeting rule is a simplified method where you save 20% of your income, and the rest (80%)'
                    'is yours to spend as you please. This rule is perfect for those who prefer a hands-off approach to budgeting'
                    'and want to ensure they are saving a portion of their income without strict constraints on their spending.',
              ),
              budgetRuleText(
                'Budgeting rule 60/40',
                'The 60/40 budgeting rule allocates 60% of your income to essential expenses and committed spending,'
                    'while the remaining 40% is divided among short-term savings, long-term savings, and discretionary spending.'
                    'This approach provides a balanced way to manage your finances, ensuring that you are covering your necessary'
                    'expenses while also saving for the future and enjoying your income.',
              ),
            ],
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
                    color: Colors.black26,
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
            items: <String>[
              'Rule 70/20/10',
              'Rule 50/30/20',
              'Rule 30/30/40',
              'Rule 80/20',
              'Rule 60/40'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(fontSize: 18)),
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

  void calculateResult(String income, String? rule) {
    labels.clear();
    values.clear();
    iconInfos.clear();

    if (income.isNotEmpty && rule != null) {
      double incomeDouble = double.tryParse(income) ?? 0;

      switch (rule) {
        case 'Rule 70/20/10':
          labels = [
            'Living Expenses and debts:',
            'Investing and Savings:',
            'Consumption and Lifestyle:'
          ];
          values = [
            '${(incomeDouble * 0.7).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.2).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.1).toStringAsFixed(2)} \$',
          ];
          iconInfos = [
            IconInfo(Icons.home, Colors.purple),
            IconInfo(Icons.savings_rounded, Colors.lightGreen),
            IconInfo(Icons.shopping_cart, Colors.amber),
          ];
          break;
        case 'Rule 50/30/20':
          labels = [
            'Living Expenses:',
            'Consumption and Lifestyle:',
            'Savings and Debts:'
          ];
          values = [
            '${(incomeDouble * 0.5).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.3).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.2).toStringAsFixed(2)} \$',
          ];
          iconInfos = [
            IconInfo(Icons.car_repair, Colors.brown),
            IconInfo(Icons.shopping_cart, Colors.amber),
            IconInfo(Icons.credit_card, Colors.blue),
          ];
          break;
        case 'Rule 30/30/40':
          labels = [
            'Living Expenses:',
            'Investing and Savings:',
            'Consumption and Lifestyle:'
          ];
          values = [
            '${(incomeDouble * 0.3).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.3).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.4).toStringAsFixed(2)} \$',
          ];
          iconInfos = [
            IconInfo(Icons.car_repair, Colors.brown),
            IconInfo(Icons.savings_rounded, Colors.lightGreen),
            IconInfo(Icons.shopping_cart, Colors.amber),
          ];
          break;
        case 'Rule 80/20':
          labels = [
            'Living Expenses, Lifestyle and Debts:',
            'Investing and Savings:'
          ];
          values = [
            '${(incomeDouble * 0.8).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.2).toStringAsFixed(2)} \$',
          ];
          iconInfos = [
            IconInfo(Icons.living, Colors.red),
            IconInfo(Icons.savings, Colors.lightGreen),
          ];
          break;
        case 'Rule 60/40':
          labels = [
            'Living Expenses, Lifestyle and Debts:',
            'Investing and Savings:'
          ];
          values = [
            '${(incomeDouble * 0.6).toStringAsFixed(2)} \$',
            '${(incomeDouble * 0.4).toStringAsFixed(2)} \$',
          ];
          iconInfos = [
            IconInfo(Icons.living, Colors.red),
            IconInfo(Icons.savings, Colors.lightGreen),
          ];
          break;
        default:
          break;
      }
    }
    notifyListeners();
  }
}
