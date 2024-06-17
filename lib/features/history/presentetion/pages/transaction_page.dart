import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/history/data/models/transaction_model.dart';
import 'package:kasir_app/features/history/presentetion/widget/transaction_item.dart';

class TransactionPage extends StatefulWidget {
  final TransactionModel txModel;

  const TransactionPage({super.key, required this.txModel});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'No. ${widget.txModel.transactionId.toString()}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 580,
                child: ListView.builder(
                    itemCount: widget.txModel.products.length,
                    itemBuilder: (context, index) {
                      final products = widget.txModel.products[index];
                      return InkWell(
                        onTap: () {},
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products.productName,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        products.productId.toString(),
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
                                              "Qty : ${products.quantity}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              products.productPrice
                                                  .currencyFormatRp,
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
              ),
              SizedBox(
                height: 20,
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
                    widget.txModel.subTotal.currencyFormatRp,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              QButton(label: 'Print', onPressed: () => {}),
            ],
          )),
    );
  }
}
