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
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 225,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: MyForm(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 225,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: MyTextWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconInfo {
  IconData icon;
  Color color;

  IconInfo(
    this.icon,
    this.color,
  );
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
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your income',
              labelStyle: TextStyle(fontSize: 18),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 2,
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
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
          const SizedBox(height: 25),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            hint: Text('Budgeting Rule', style: TextStyle(fontSize: 18)),
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
                child: Text(value, style: TextStyle(fontSize: 18)),
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
                            Icon(
                              ruleModel.iconInfos[index].icon,
                              color: ruleModel.iconInfos[index].color,
                              size: 36,
                            ),
                            SizedBox(width: 20),
                            Text(
                              ruleModel.labels[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                height: 2.5,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          ruleModel.values[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 2.5,
                          ),
                        ),
                      ],
                    );
                  })
                : [
                    Text(
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
            IconInfo(Icons.shopping_basket, Colors.amber),
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
            IconInfo(Icons.shopping_basket, Colors.amber),
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
            IconInfo(Icons.shopping_basket, Colors.amber),
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
