import 'package:flutter/material.dart';
import 'package:kasir_app/features/history/data/models/transaction_model.dart';

class Transaction {
  final String name;
  final String type;
  final double total;

  Transaction({
    required this.name,
    required this.type,
    required this.total,
  });
}

class TransactionItem extends StatelessWidget {
  final TransactionModel tx;
  final int itemcount;
  final VoidCallback? onTap;

  TransactionItem({this.onTap, required this.tx, required this.itemcount});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
