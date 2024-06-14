import 'package:flutter/material.dart';

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
  final Transaction transaction;
  final VoidCallback? onTap;

  TransactionItem({required this.transaction, this.onTap});

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
                      transaction.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transaction.type,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.remove,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text('1'),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 100.0),
                        Text(
                          '€ ${transaction.total.toStringAsFixed(2)}',
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
