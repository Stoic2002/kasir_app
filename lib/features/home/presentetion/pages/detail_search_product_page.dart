import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';

import 'package:kasir_app/features/transaction/presentetion/widget/show_selected_product.dart';

class DetailSearchProductPage extends StatefulWidget {
  final ProductNewModel productModel;

  const DetailSearchProductPage({super.key, required this.productModel});

  @override
  State<DetailSearchProductPage> createState() =>
      _DetailSearchProductPageState();
}

class _DetailSearchProductPageState extends State<DetailSearchProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Product',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 260.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.productModel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        9.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  child: Text(
                    widget.productModel.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 24,
                  width: double.infinity,
                  child: SizedBox(
                    height: 24,
                    width: 159,
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_rounded,
                          size: 24,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          'product ${widget.productModel.categoryName}',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 106,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 24,
                        height: 106,
                        child: Icon(
                          Icons.description_outlined,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: 307,
                        height: 106,
                        child: Text(widget.productModel.description,
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  child: Text(
                    widget.productModel.price.currencyFormatRp,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                QButton(
                    label: 'add to bag',
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(AddProduct(product: widget.productModel));
                      ShowSelectedProduct().showSelectedProducts(context);
                    }),
              ],
            ),
          ),
        ));
  }
}
