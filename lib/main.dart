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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your income',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.attach_money),
              ),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            hint: const Text('Budgeting Rule'),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
                context.read<RuleModel>().selectRule(newValue);
              });
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
            ruleModel.selectedRule != null
                ? 'You chose ${ruleModel.selectedRule}'
                : 'Please choose a budgeting rule',
            textAlign: TextAlign.justify,
          ),
        );
      },
    );
  }
}

class RuleModel extends ChangeNotifier {
  String? _selectedRule;

  String? get selectedRule => _selectedRule;

  void selectRule(String? rule) {
    _selectedRule = rule;
    notifyListeners();
  }
}
