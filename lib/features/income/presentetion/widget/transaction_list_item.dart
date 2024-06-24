import 'package:flutter/material.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/transaction/data/models/order_model.dart';

// class Transaction {
//   final String id;
//   final String time;
//   final double total;

//   Transaction({
//     required this.id,
//     required this.time,
//     required this.total,
//   });
// }

class TransactionListItem extends StatelessWidget {
  final OrderModel transaction;
  final VoidCallback? onTap;

  TransactionListItem({required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
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
                  child: Icon(Icons.image, color: Colors.grey[700]),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.transactionId.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transaction.createdAt,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 30.0),
                        Text(
                          transaction.subtotal!.currencyFormatRp,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
