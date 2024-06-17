import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';

class ProductItemShow extends StatelessWidget {
  const ProductItemShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CheckoutFailure) {
          return Text(state.message);
        }
        if (state is CheckoutLoaded) {
          return Column(
            children: [
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 163,
                      child: Row(
                        children: [
                          Container(
                            width: 115,
                            height: 121,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                    image:
                                        state.products[index].product.image)),
                          ),
                          Container(
                            width: 250,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  width: 203,
                                  height: 60,
                                  child: Text(
                                    state.products[index].product.name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  width: 203,
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          state.products[index].product.price
                                              .currencyFormatRp,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<CheckoutBloc>()
                                                      .add(RemoveProduct(
                                                          product: state
                                                              .products[index]
                                                              .product));
                                                },
                                                child: Icon(
                                                  size: 14,
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(state.products[index].quantity
                                                .toString()),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<CheckoutBloc>()
                                                      .add(AddProduct(
                                                          product: state
                                                              .products[index]
                                                              .product));
                                                },
                                                child: Icon(
                                                  size: 14,
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              QButton(
                  width: 300,
                  label: 'Checkout',
                  onPressed: () {
                    context.goNamed(RouteConstants.order,
                        pathParameters: PathParameters().toMap());
                  })
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
