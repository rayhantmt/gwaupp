// class ExpenseHistoryModel {
//   final String datetime;
//   final String amount;
//   final String tittle;
//   final String note;
//   final bool bank;

//   ExpenseHistoryModel(this.bank, {required this.datetime, required this.amount, required this.tittle, required this.note});
  

// }
import 'package:intl/intl.dart';

class ExpenseHistoryModel {
  // ✅ Existing fields — unchanged
  final String datetime;
  final String amount;
  final String tittle;
  final String note;
  final TransType bank;

  // ✅ New fields from API response
  final String? id;
  final String? userId;
  final String? category;
  final bool? repeat;
  final String? type;
  final String? createdAt;
  final String? updatedAt;

  ExpenseHistoryModel(
    this.bank, {
    required this.datetime,
    required this.amount,
    required this.tittle,
    required this.note,
    // new fields are optional so existing local dummy data won't break
    this.id,
    this.userId,
    this.category,
    this.repeat,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to map API JSON to model
  factory ExpenseHistoryModel.fromJson(Map<String, dynamic> json) {
    return ExpenseHistoryModel(
      _parseTransType(json['payment_method']),
      datetime: json['date_time'] ?? '',
      amount: json['amount'].toString(),
      tittle: json['category'] ?? '',
      note: json['note'] ?? '',
      id: json['_id'],
      userId: json['userId'],
      category: json['category'],
      repeat: json['repeat'],
      type: json['type'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
  String get formattedDatetime {
    if (datetime.isEmpty) return '';
    final parsed = DateTime.tryParse(datetime);
    if (parsed == null) return datetime; // fallback to raw string if parse fails
    return DateFormat('M/dd/yy h:mm a').format(parsed.toLocal());
  }

  static TransType _parseTransType(String? method) {
    switch (method?.toLowerCase()) {
      case 'bank':
        return TransType.bank;
      case 'credit':
        return TransType.credit;
      case 'cash':
        return TransType.cash;
      default:
        return TransType.bank;
    }
  }
}

enum TransType { bank, credit, cash }