// lib/food_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';

import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/features/home/presentetion/bloc/product/product_bloc.dart';

class FoodListView extends StatefulWidget {
  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetListProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is ProductLoaded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('loaded')));
        }
      },
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryProductsLoaded) {
          return SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: state.foodProducts.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                var food = state.foodProducts[index];
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 210,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Center(
                                    child:
                                        CircularProgressIndicator()), // Loading indicator
                                FadeInImage(
                                  placeholder:
                                      Assets.images.placeholder.provider(),
                                  image: NetworkImage(food.imageUrl),
                                  fit: BoxFit.cover,
                                  width: 210,
                                  height: double.infinity,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              Text(
                                food.price.currencyFormatRp,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        )
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
