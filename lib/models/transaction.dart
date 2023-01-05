// import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  // named arguments instead positional args
  Transaction({ required this.id, required this.title, required this.amount, required this.date});
}
