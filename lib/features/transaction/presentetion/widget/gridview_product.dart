import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/home/data/models/product_model.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/pages/yourbag_page.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/product_item.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/show_selected_product.dart';

class GridviewProduct extends StatefulWidget {
  final List<ProductModel> products;

  GridviewProduct({required this.products});

  @override
  State<GridviewProduct> createState() => _GridviewProductState();
}

class _GridviewProductState extends State<GridviewProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 250,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0 / 1.4,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
        ),
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.products[index];
          return GestureDetector(
            onTap: () {
              context.goNamed(RouteConstants.detailProduct,
                  pathParameters: PathParameters().toMap(), extra: item);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: item.image,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              item.price.currencyFormatRp,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            ShowSelectedProduct().showSelectedProducts(context);
                            context
                                .read<CheckoutBloc>()
                                .add(AddProduct(product: item));
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 17.0,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
