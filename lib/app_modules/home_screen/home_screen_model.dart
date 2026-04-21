// analytics_model.dart
class AnalyticsModel {
  final int year;
  final int month;
  final String netSavingsAmount;
  final double netSavingsChangePercent;
  final String incomeAmount;
  final double incomeChangePercent;
  final String expenseAmount;
  final double expenseChangePercent;
  final String spendingTarget;
  final String spendingSpent;
  final String spendingRemaining;
  final String topCategory;
  final String topCategoryAmount;
  final String overspent;

  AnalyticsModel({
    required this.year,
    required this.month,
    required this.netSavingsAmount,
    required this.netSavingsChangePercent,
    required this.incomeAmount,
    required this.incomeChangePercent,
    required this.expenseAmount,
    required this.expenseChangePercent,
    required this.spendingTarget,
    required this.spendingSpent,
    required this.spendingRemaining,
    required this.topCategory,
    required this.topCategoryAmount,
    required this.overspent,
  });

 factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AnalyticsModel(
      year: data['period']?['year'] ?? 0,
      month: data['period']?['month'] ?? 0,
      netSavingsAmount: (data['netSavings']?['amount'] as String?)?.toString() ?? '0.00',
      overspent: (data['netSavings']?['overExpense'] as String?)?.toString() ?? '0.00',
      netSavingsChangePercent: (data['netSavings']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      incomeAmount: (data['income']?['amount'] as String?)?.toString() ?? '0.00',
      incomeChangePercent: (data['income']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      expenseAmount: (data['expense']?['amount'] as String?)?.toString() ?? '0.00',
      expenseChangePercent: (data['expense']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      spendingTarget: (data['spendingTarget']?['target_amount'] as String?)?.toString() ?? '0.00',
      spendingSpent: (data['spendingTarget']?['spent'] as String?)?.toString() ?? '0.00',
      spendingRemaining: (data['spendingTarget']?['remaining'] as String?)?.toString() ?? '0.00',
      topCategory: data['topSpendingCategory']?['category'] ?? 'No data available',
      topCategoryAmount: (data['topSpendingCategory']?['amount'] as String?)?.toString() ?? '0.00',
    );
  }
}