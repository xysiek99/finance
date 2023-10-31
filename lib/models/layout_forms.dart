import 'package:flutter/material.dart';

Widget budgetRuleText(String title, String description) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      const SizedBox(height: 30),
    ],
  );
}
