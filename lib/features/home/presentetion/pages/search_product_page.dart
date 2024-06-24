import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/extension/int_ext.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/home/presentetion/bloc/search/search_bloc.dart';
import 'package:kasir_app/features/home/presentetion/widget/search_field.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Search Product',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SearchField(
              controller: _searchController,
              focusNode: _focusNode,
              hint: 'search',
              onChanged: (query) {
                context.read<SearchBloc>().add(SearchQueryChanged(query));
              },
            ),
            SizedBox(height: 5),
            Container(
              height: 620,
              width: double.infinity,
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0 / 1.4,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                                RouteConstants.searchProductDetail,
                                pathParameters: PathParameters().toMap(),
                                extra: product);
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 180,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(product.name),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(product.price.currencyFormatRp),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: Text('No products found.'));
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
