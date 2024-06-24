import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';

import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/getproduct/getproduct_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/show_selected_product.dart';

class GridviewDrinkProduct extends StatefulWidget {
  @override
  State<GridviewDrinkProduct> createState() => _GridviewDrinkProductState();
}

class _GridviewDrinkProductState extends State<GridviewDrinkProduct> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<GetproductBloc>().add(GetproductLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetproductBloc, GetproductState>(
      builder: (context, state) {
        if (state is GetproductLoaded) {
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
              itemCount: state.drinkProducts.length,
              itemBuilder: (BuildContext context, int index) {
                var item = state.drinkProducts[index];
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
                                image: NetworkImage(item.imageUrl),
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
                                  ShowSelectedProduct()
                                      .showSelectedProducts(context);
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
        return Container();
      },
    );
  }
}
