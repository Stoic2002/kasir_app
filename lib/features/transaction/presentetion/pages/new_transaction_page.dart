import 'package:flutter/material.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/features/home/data/datasources/data_product.dart';
import 'package:kasir_app/features/home/data/models/category_model.dart';
import 'package:kasir_app/features/home/data/models/product_model.dart';
import 'package:kasir_app/features/home/presentetion/widget/search_field.dart';
import 'package:kasir_app/features/transaction/presentetion/widget/gridview_product.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage>
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
            SearchField(
              hint: 'Minuman',
              onChanged: (value) {
                print('Search query: $value');
              },
              onSubmitted: (value) {
                print('Submitted query: $value');
              },
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  width: 102,
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
                            'Sort',
                            style: TextStyle(fontSize: 12),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: AppColors.grey),
                          value: _selectedValue,
                          items: <String>[
                            'Option 1',
                            'Option 2',
                            'Option 3',
                            'Option 4'
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
                Spacer(),
                Container(
                  width: 111,
                  height: 36,
                  padding: const EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        size: 18.0,
                        color: AppColors.grey2,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 14.0,
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
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
              child: TabBarView(
                controller: _tabController,
                children: categories.map((category) {
                  return GridviewProduct(products: category.productModel);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
