class IncomeHistoryModel {
  final String datetime;
  final String amount;
  final String tittle;
  final String note;
  final TransType bank;

  IncomeHistoryModel(
    this.bank, {
    required this.datetime,
    required this.amount,
    required this.tittle,
    required this.note,
  });
}

enum TransType { bank, credit, cash }
