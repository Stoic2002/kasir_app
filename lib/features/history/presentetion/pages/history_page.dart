import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/history/presentetion/bloc/transaction/transaction_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionBloc>().add(TransactionLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'History Transaction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TransactionLoaded) {
            return Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 630,
              child: ListView.builder(
                  itemCount: state.transaction.length,
                  itemBuilder: (context, index) {
                    final tx = state.transaction[index];

                    return InkWell(
                      onTap: () {
                        context.pushNamed(RouteConstants.txDetail,
                            pathParameters: PathParameters().toMap(),
                            extra: tx);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.image,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No. ${tx.transactionId.toString()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      tx.createdAt,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            tx.subTotal.currencyFormatRp,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
