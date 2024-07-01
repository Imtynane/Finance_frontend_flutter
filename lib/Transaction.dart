import 'dart:convert';

class Transaction {
  late int id;
  late String description;
  late double amount;

  Transaction({required this.id, required this.description, required this.amount});

  static List<Transaction> parseTransactions(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      description: json['description'],
      amount: json['amount'].toDouble(),
    );
  }
}
