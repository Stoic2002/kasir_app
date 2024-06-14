import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[900]!,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.swap_vert,
                          size: 24.0,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Sort'),
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.black),
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
                    padding: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[900]!,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 24.0,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "Filter",
                          style: TextStyle(
                            fontSize: 16.0,
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
                tabs: [
                  Tab(
                      child: Text('Minuman',
                          style: TextStyle(color: Colors.black))),
                  Tab(
                      child: Text('Makanan',
                          style: TextStyle(color: Colors.black))),
                  Tab(
                      child: Text('Cemilan',
                          style: TextStyle(color: Colors.black))),
                  Tab(
                      child: Text('Masakan',
                          style: TextStyle(color: Colors.black))),
                ],
              ),
              const SizedBox(height: 10.0),
              GridviewProduct(),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
