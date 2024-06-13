import 'package:flutter/material.dart';

import 'package:kasir_app/features/home/presentetion/widget/carousel.dart';
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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                SearchField(
                  onChanged: (value) {
                    print('Search query: $value');
                  },
                  onSubmitted: (value) {
                    print('Submitted query: $value');
                  },
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
                H4(
                    title: 'Populer',
                    subtitle: 'See more',
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          )
                        }),
                const SizedBox(height: 10.0),
                FoodListView(),
                const SizedBox(height: 20.0),
                H4(
                    title: 'Minuman',
                    subtitle: 'See more',
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          )
                        }),
                const SizedBox(height: 10.0),
                FoodListView(),
                const SizedBox(height: 70.0),
              ],
            )),
      ),
    );
  }
}
