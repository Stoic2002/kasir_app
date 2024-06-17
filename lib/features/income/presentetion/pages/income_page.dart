import 'package:flutter/material.dart';
import 'package:kasir_app/features/income/presentetion/pages/history_income.dart';
import 'package:kasir_app/features/income/presentetion/widget/bar_chart.dart';
import 'package:kasir_app/features/income/presentetion/widget/card.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Text(
              "This Month",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "€ 5143.00",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "30 Days / 31 Days",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25.0),
            AspectRatio(
              aspectRatio: 1.6,
              child: CustomBarChart(),
            ),
            const SizedBox(height: 25.0),
            TransactionCard(
              title: "Today",
              subtitle: "20 Transaction",
              amount: "€ 343.00",
              onTap: () {},
            ),
            SizedBox(height: 10),
            TransactionCard(
              title: "29 Mei 2024",
              subtitle: "17 Transaction",
              amount: "€ 243.00",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryIncome()),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
