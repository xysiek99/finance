import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RuleModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: const [
            Expanded(
              child: Center(
                child: MyForm(),
              ),
            ),
            Expanded(
              child: Center(
                child: MyTextWidget(),
              ),
            ),
          ],
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your income',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
              ),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
            onChanged: (value) {
              context.read<RuleModel>().calculateResult(value, dropdownValue);
            },
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            hint: const Text('Budgeting Rule'),
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
                child: Text(value),
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
          child: Text(
            ruleModel.dividedIncome != null
                ? '${ruleModel.dividedIncome}'
                : 'Please choose a budgeting rule and enter your income',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

class RuleModel extends ChangeNotifier {
  String? selectedRule;
  String? dividedIncome;

  void selectRule(String? rule) {
    selectedRule = rule;
    notifyListeners();
  }

  void calculateResult(String income, String? rule) {
    if (income.isEmpty || rule == null) {
      dividedIncome = null;
    } else {
      double incomeDouble = double.tryParse(income) ?? 0;
      switch (rule) {
        case 'Rule 70/20/10':
          dividedIncome = '''
            Living Expenses and debts: ${(incomeDouble * 0.7).toStringAsFixed(2)}
            Investing and Savings: ${(incomeDouble * 0.2).toStringAsFixed(2)}
            Consumption and Lifestyle: ${(incomeDouble * 0.1).toStringAsFixed(2)}
            ''';
          break;
        case 'Rule 50/30/20':
          dividedIncome = '''
            Living Expenses: ${(incomeDouble * 0.5).toStringAsFixed(2)}
            Consumption and Lifestyle: ${(incomeDouble * 0.3).toStringAsFixed(2)}
            Savings and Debts: ${(incomeDouble * 0.2).toStringAsFixed(2)}
            ''';
          break;
        case 'Rule 30/30/40':
          dividedIncome = '''
            Living Expenses: ${(incomeDouble * 0.3).toStringAsFixed(2)}
            Investing and Savings: ${(incomeDouble * 0.3).toStringAsFixed(2)}
            Consumption and Lifestyle: ${(incomeDouble * 0.4).toStringAsFixed(2)}
            ''';
          break;
        case 'Rule 80/20':
          dividedIncome = '''
            Living Expenses, Lifestyle and Debts: ${(incomeDouble * 0.8).toStringAsFixed(2)}
            Investing and Savings: ${(incomeDouble * 0.2).toStringAsFixed(2)}
            ''';
          break;
        case 'Rule 60/40':
          dividedIncome = '''
            Living Expenses, Lifestyle and Debts: ${(incomeDouble * 0.6).toStringAsFixed(2)}
            Investing and Savings: ${(incomeDouble * 0.4).toStringAsFixed(2)}
            ''';
          break;
        default:
          break;
      }
    }
    notifyListeners();
  }
}
