import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/extension/int_ext.dart';

import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/order/order_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/product_item.dart';

class YourbagPage extends StatefulWidget {
  const YourbagPage({super.key});

  @override
  State<YourbagPage> createState() => _YourbagPageState();
}

class _YourbagPageState extends State<YourbagPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your bag',
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
          child: Container(
            padding: EdgeInsets.only(left: 12.5, right: 15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 570,
                  child: ProductItem(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        if (state is CheckoutLoaded) {
                          final totalPrice = state.products.fold<int>(
                              0,
                              (previousValue, element) =>
                                  previousValue +
                                  (element.quantity * element.product.price));
                          return Text(
                            totalPrice.currencyFormatRp,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Text(
                          '0',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Pembayaran Gagal')));
                    }
                    if (state is CheckoutLoaded) {
                      return BlocConsumer<OrderBloc, OrderState>(
                        listener: (context, orderState) {
                          // TODO: implement listener
                          if (orderState is OrderFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(orderState.message)));
                          }

                          if (orderState is OrderSuccess) {
                            context.pop();
                            context.pop();
                          }

                          if (orderState is OrderSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Pembayaran Berhasil')));
                          }

                          if (orderState is OrderSuccess) {
                            context.read<CheckoutBloc>().add(ResetProduct());
                          }
                        },
                        builder: (BuildContext context, OrderState orderState) {
                          if (orderState is OrderLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return QButton(
                              label: 'Order',
                              onPressed: () {
                                if (user != null) {
                                  final uid = user!.uid;

                                  context.read<OrderBloc>().add(OnOrder(
                                      userId: uid,
                                      transactionId:
                                          DateTime.now().millisecondsSinceEpoch,
                                      products: state.products));
                                }
                              });
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
