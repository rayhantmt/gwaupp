// class MonthlyData {
//   final String month;
//   final double value;

//   MonthlyData({
//     required this.month,
//     required this.value,
//   });
// }
// class BusinessData{
//   final String tittle;
//   final int lastmonthIncome;
//   final int thismonthIncome;
//   final bool profit;
//   final int profilorlosspercent;

//   BusinessData( {required this.profilorlosspercent, required this.tittle, required this.lastmonthIncome, required this.thismonthIncome, required this.profit});
// }
class BusinessData {
  final String tittle;
  final int lastmonthIncome;
  final int thismonthIncome;
  final bool profit;
  final int profilorlosspercent;
  final String trend; // storing raw trend value too

  BusinessData({
    required this.profilorlosspercent,
    required this.tittle,
    required this.lastmonthIncome,
    required this.thismonthIncome,
    required this.profit,
    required this.trend,
  });

  factory BusinessData.fromJson(Map<String, dynamic> json) {
    final trend = json['trend'] ?? 'same';
    return BusinessData(
      tittle: json['category'] ?? '',
      thismonthIncome: (json['currentTotal'] as num?)?.toInt() ?? 0,
      lastmonthIncome: (json['lastQuarterTotal'] as num?)?.toInt() ?? 0,
      profilorlosspercent: (json['changePercent'] as num?)?.toInt() ?? 0,
      profit: trend == 'down' ? false : true,
      trend: trend,
    );
  }
}

class MonthlyData {
  final String month;
  final double value;
  final String category;
  final String quarter;
  final String quarterLabel;

  MonthlyData({
    required this.month,
    required this.value,
    required this.category,
    required this.quarter,
    required this.quarterLabel,
  });

  factory MonthlyData.fromJson(Map<String, dynamic> json) {
    return MonthlyData(
      month: json['quarterLabel'] ?? '',
      value: (json['total'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      quarter: json['quarter'] ?? '',
      quarterLabel: json['quarterLabel'] ?? '',
    );
  }
}