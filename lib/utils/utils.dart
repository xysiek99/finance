// Helper functions
List<String> convertPercentagesToStrings(List<double> percentages) {
  return percentages
      .map((item) => '${(item * 100).toStringAsFixed(0)}% ')
      .toList();
}
