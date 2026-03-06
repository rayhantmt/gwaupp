class MonthlyData {
  final String month;
  final double value;

  MonthlyData({
    required this.month,
    required this.value,
  });
}
class BusinessData{
  final String tittle;
  final int lastmonthIncome;
  final int thismonthIncome;
  final bool profit;
  final int profilorlosspercent;

  BusinessData( {required this.profilorlosspercent, required this.tittle, required this.lastmonthIncome, required this.thismonthIncome, required this.profit});
}