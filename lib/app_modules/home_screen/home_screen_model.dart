// analytics_model.dart
class AnalyticsModel {
  final int year;
  final int month;
  final double netSavingsAmount;
  final double netSavingsChangePercent;
  final double incomeAmount;
  final double incomeChangePercent;
  final double expenseAmount;
  final double expenseChangePercent;
  final double spendingTarget;
  final double spendingSpent;
  final double spendingRemaining;
  final String topCategory;
  final double topCategoryAmount;

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
  });

 factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AnalyticsModel(
      year: data['period']?['year'] ?? 0,
      month: data['period']?['month'] ?? 0,
      netSavingsAmount: (data['netSavings']?['amount'] as num?)?.toDouble() ?? 0.0,
      netSavingsChangePercent: (data['netSavings']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      incomeAmount: (data['income']?['amount'] as num?)?.toDouble() ?? 0.0,
      incomeChangePercent: (data['income']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      expenseAmount: (data['expense']?['amount'] as num?)?.toDouble() ?? 0.0,
      expenseChangePercent: (data['expense']?['changePercent'] as num?)?.toDouble() ?? 0.0,
      spendingTarget: (data['spendingTarget']?['target_amount'] as num?)?.toDouble() ?? 0.0,
      spendingSpent: (data['spendingTarget']?['spent'] as num?)?.toDouble() ?? 0.0,
      spendingRemaining: (data['spendingTarget']?['remaining'] as num?)?.toDouble() ?? 0.0,
      topCategory: data['topSpendingCategory']?['category'] ?? 'No data available',
      topCategoryAmount: (data['topSpendingCategory']?['amount'] as num?)?.toDouble() ?? 0.0,
    );
  }
}