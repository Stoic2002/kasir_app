import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/income/presentetion/bloc/income/income_bloc.dart';
import 'package:kasir_app/features/income/presentetion/pages/daily_history_income.dart';
import 'package:kasir_app/features/income/presentetion/pages/monthly_history_income.dart';
import 'package:kasir_app/features/income/presentetion/widget/bar_chart.dart';
import 'package:kasir_app/features/income/presentetion/widget/card.dart';
import 'package:kasir_app/features/income/presentetion/widget/monthly_income_chart.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IncomeBloc>().add(LoadMonthlyTransactions());
    context.read<IncomeBloc>().add(LoadTodaysTransactions());
    context.read<IncomeBloc>().add(LoadDailyIncomeForMonth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IncomeBloc, IncomeState>(
        builder: (context, state) {
          return Padding(
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
                  state.monthlyTotalPurchases!.currencyFormatRp,
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
                const SizedBox(height: 25.0),
                TransactionCard(
                  title: "Today",
                  subtitle: "${state.todayTotalTransactions} Transactions",
                  amount: state.todayTotalPurchases!.currencyFormatRp,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DailyHistoryIncome()),
                    );
                  },
                ),
                SizedBox(height: 10),
                TransactionCard(
                  title: "This Month",
                  subtitle: "${state.monthlyTotalTransactions} Transaction",
                  amount: state.monthlyTotalPurchases!.currencyFormatRp,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MonthlyHistoryIncome()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
