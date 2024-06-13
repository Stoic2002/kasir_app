import 'package:flutter/material.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/history/presentetion/widget/transaction_item.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = List.generate(
      5,
      (index) => Transaction(name: 'Cake', type: 'Dingin', total: 12.00),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction 003',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: transactions.map((transaction) {
                  return TransactionItem(transaction: transaction);
                }).toList(),
              ),
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '€ 83.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              QButton(label: 'Print', onPressed: () => {}),
            ],
          ),
        ),
      ),
    );
  }
}
