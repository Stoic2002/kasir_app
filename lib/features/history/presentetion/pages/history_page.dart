import 'package:flutter/material.dart';
import 'package:kasir_app/features/history/presentetion/pages/transaction_page.dart';
import 'package:kasir_app/features/income/presentetion/widget/transaction_list_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = List.generate(
      3,
      (index) => Transaction(
          id: 'Transaction 0${3 - index}', time: '30 Mei 2024', total: 12.00),
    );
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'History Transaction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: transactions.map((transaction) {
                  return TransactionListItem(
                    transaction: transaction,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionPage()),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: transactions.map((transaction) {
                  return TransactionListItem(
                      transaction: transaction,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionPage()),
                        );
                      });
                }).toList(),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
