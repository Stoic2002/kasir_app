import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/home/data/datasources/data_product.dart';
import 'package:kasir_app/features/home/data/models/category_model.dart';

import 'package:kasir_app/features/home/presentetion/widget/search_field.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/gridview_drink_product.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/gridview_food_product.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/gridview_liquor_product.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/gridview_snacks_product.dart';

class NewTransactionPageX extends StatefulWidget {
  const NewTransactionPageX({super.key});

  @override
  State<NewTransactionPageX> createState() => _NewTransactionPageXState();
}

class _NewTransactionPageXState extends State<NewTransactionPageX>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    final List<CategoryModel> categories = DataProduct().categories;
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = DataProduct().categories;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                context.pushNamed(RouteConstants.searchProduct,
                    pathParameters: PathParameters().toMap());
              },
              child: AbsorbPointer(
                child: SearchField(
                  hint: 'Minuman',
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  width: 108,
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.swap_vert,
                        size: 18.0,
                        color: AppColors.grey2,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          style: TextStyle(fontSize: 11, color: Colors.black),
                          hint: Text(
                            'Default',
                            style: TextStyle(fontSize: 12),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: AppColors.grey),
                          value: _selectedValue,
                          items: <String>[
                            'Termurah',
                            'Termahal',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            TabBar(
              controller: _tabController,
              dividerHeight: 0,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              tabs: categories
                  .map((category) => Tab(
                        child: Text(
                          category.categoryName,
                          style: TextStyle(fontSize: 13),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                GridviewFoodProduct(),
                GridviewDrinkProduct(),
                GridviewSnacksProduct(),
                GridviewLiquorProduct()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
