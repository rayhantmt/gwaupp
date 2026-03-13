class ExpenseHistoryModel {
  final String datetime;
  final String amount;
  final String tittle;
  final String note;
  final bool bank;

  ExpenseHistoryModel(this.bank, {required this.datetime, required this.amount, required this.tittle, required this.note});
  

}