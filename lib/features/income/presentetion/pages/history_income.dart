import 'package:flutter/material.dart';
import 'package:kasir_app/features/income/presentetion/widget/transaction_list_item.dart';

class HistoryIncome extends StatefulWidget {
  @override
  State<HistoryIncome> createState() => _HistoryIncomeState();
}

class _HistoryIncomeState extends State<HistoryIncome> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = List.generate(
      17,
      (index) => Transaction(
          id: 'Transaction 0${17 - index}',
          time: '20.${60 - index}',
          total: 12.00),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Income 29 Mei',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '€ 243.00',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '17 Transactions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionListItem(
                    transaction: transactions[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
