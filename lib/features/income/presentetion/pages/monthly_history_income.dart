import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/income/presentetion/bloc/income/income_bloc.dart';
import 'package:kasir_app/features/income/presentetion/widget/transaction_list_item.dart';

class MonthlyHistoryIncome extends StatefulWidget {
  @override
  State<MonthlyHistoryIncome> createState() => _MonthlyHistoryIncomeState();
}

class _MonthlyHistoryIncomeState extends State<MonthlyHistoryIncome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IncomeBloc>().add(LoadMonthlyTransactions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'This Month',
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
      body: BlocConsumer<IncomeBloc, IncomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.monthlyTotalPurchases!.currencyFormatRp,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${state.monthlyTotalTransactions} Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.monthlyTransactions!.length,
                    itemBuilder: (context, index) {
                      return TransactionListItem(
                        transaction: state.monthlyTransactions![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
