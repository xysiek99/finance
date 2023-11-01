import 'package:flutter/material.dart';

class BudgetRule {
  String name;
  String description;
  List<double> percentage;
  List<String> labels;
  List<IconInfo> iconInfos;

  BudgetRule({
    required this.name,
    required this.description,
    required this.percentage,
    required this.labels,
    required this.iconInfos,
  });
}

class IconInfo {
  IconData icon;
  Color color;

  IconInfo(this.icon, this.color);
}

List<BudgetRule> budgetRules = [
  BudgetRule(
    name: 'Budgeting rule 70/20/10',
    description:
        'The 70/20/10 budgeting rule is a simple and effective way to manage your finances. '
        'According to this rule, you allocate 70% of your income to essential expenses such as rent, utilities, groceries, and transportation. '
        '20% goes towards savings and investments for your future, including retirement funds, emergency savings, or other financial goals. '
        'The remaining 10% is designated for personal spending, allowing you to enjoy your hobbies, dining out, or other leisure activities without guilt. '
        'By following the 70/20/10 rule, you can ensure a balanced financial life, securing your future while also enjoying the present.',
    percentage: [0.7, 0.2, 0.1],
    labels: [
      'Living Expenses and debts:',
      'Investing and Savings:',
      'Consumption and Lifestyle:'
    ],
    iconInfos: [
      IconInfo(Icons.home, Colors.purple),
      IconInfo(Icons.savings_rounded, Colors.lightGreen),
      IconInfo(Icons.shopping_cart, Colors.amber),
    ],
  ),
  BudgetRule(
    name: 'Budgeting rule 50/30/20',
    description:
        'The 50/30/20 budgeting rule is a straightforward method to divide your income. '
        '50% of your income should be allocated to necessities like housing, groceries, and bills. '
        '30% can be used for discretionary expenses such as entertainment, dining out, or shopping. '
        'Finally, 20% should be saved or invested for future financial stability. '
        'This rule is great for those who want a simple way to manage their finances while ensuring savings.',
    percentage: [0.5, 0.3, 0.2],
    labels: [
      'Living Expenses:',
      'Consumption and Lifestyle:',
      'Savings and Debts:'
    ],
    iconInfos: [
      IconInfo(Icons.car_repair, Colors.pink),
      IconInfo(Icons.shopping_cart, Colors.amber),
      IconInfo(Icons.credit_card, Colors.blue),
    ],
  ),
  BudgetRule(
    name: 'Budgeting rule 30/30/40',
    description:
        'The 50/30/20 budgeting rule is a straightforward method to divide your income. '
        '50% of your income should be allocated to necessities like housing, groceries, and bills. '
        '30% can be used for discretionary expenses such as entertainment, dining out, or shopping. '
        'Finally, 20% should be saved or invested for future financial stability. '
        'This rule is great for those who want a simple way to manage their finances while ensuring savings.',
    percentage: [0.3, 0.3, 0.4],
    labels: [
      'Living Expenses:',
      'Investing and Savings:',
      'Consumption and Lifestyle:'
    ],
    iconInfos: [
      IconInfo(Icons.car_repair, Colors.pink),
      IconInfo(Icons.savings_rounded, Colors.lightGreen),
      IconInfo(Icons.shopping_cart, Colors.amber),
    ],
  ),
  BudgetRule(
    name: 'Budgeting rule 80/20',
    description:
        'The 80/20 budgeting rule is a simplified method where you save 20% of your income, and the rest (80%)'
        'is yours to spend as you please. This rule is perfect for those who prefer a hands-off approach to budgeting'
        'and want to ensure they are saving a portion of their income without strict constraints on their spending.',
    percentage: [0.8, 0.2],
    labels: ['Living Expenses, Lifestyle and Debts:', 'Investing and Savings:'],
    iconInfos: [
      IconInfo(Icons.living, Colors.red),
      IconInfo(Icons.savings, Colors.lightGreen),
    ],
  ),
  BudgetRule(
    name: 'Budgeting rule 60/40',
    description:
        'The 60/40 budgeting rule allocates 60% of your income to essential expenses and committed spending,'
        'while the remaining 40% is divided among short-term savings, long-term savings, and discretionary spending.'
        'This approach provides a balanced way to manage your finances, ensuring that you are covering your necessary'
        'expenses while also saving for the future and enjoying your income.',
    percentage: [0.6, 0.4],
    labels: ['Living Expenses, Lifestyle and Debts:', 'Investing and Savings:'],
    iconInfos: [
      IconInfo(Icons.living, Colors.red),
      IconInfo(Icons.savings, Colors.lightGreen),
    ],
  ),
];
