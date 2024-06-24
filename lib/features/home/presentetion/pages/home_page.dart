import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';

import 'package:kasir_app/features/home/presentetion/widget/carousel.dart';
import 'package:kasir_app/features/home/presentetion/widget/drink_listview.dart';
import 'package:kasir_app/features/home/presentetion/widget/food_listview.dart';
import 'package:kasir_app/features/home/presentetion/widget/heading.dart';
import 'package:kasir_app/features/home/presentetion/widget/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            RouteConstants.addProduct,
            pathParameters: PathParameters().toMap(),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteConstants.searchProduct,
                        pathParameters: PathParameters().toMap());
                  },
                  child: AbsorbPointer(child: SearchField()),
                ),
                QCarousel(
                  images: [
                    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                    "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                  ],
                ),
                const SizedBox(height: 20.0),
                H4(title: 'Makanan', subtitle: 'See more', onPressed: () => {}),
                const SizedBox(height: 10.0),
                Container(height: 200, child: FoodListView()),
                const SizedBox(height: 20.0),
                H4(title: 'Minuman', subtitle: 'See more', onPressed: () => {}),
                const SizedBox(height: 10.0),
                DrinkListView(),
                const SizedBox(height: 70.0),
              ],
            )),
      ),
    );
  }
}
