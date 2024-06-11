import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_app/features/home/presentetion/widget/carousel.dart';
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
        child: Container(
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
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      List<Map<String, dynamic>> foods = [
                        {
                          "nama": "Sate Ayam",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Gado-gado",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1562607635-4608ff48a859?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Pecel Lele",
                          "harga": 11000,
                          "image":
                              "https://images.unsplash.com/photo-1613653739328-e86ebd77c9c8?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Soto",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1572656631137-7935297eff55?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Ramen",
                          "harga": 16000,
                          "image":
                              "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGluZG9uZXNpYW4lMjBmb29kfGVufDB8fDB8fHww"
                        },
                      ];
                      var food = foods[index];
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          food["image"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          food["nama"],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "Rp ${NumberFormat("#,##0", "id_ID").format(food["harga"])}",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ));
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      List<Map<String, dynamic>> foods = [
                        {
                          "nama": "Sate Ayam",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Gado-gado",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1562607635-4608ff48a859?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Pecel Lele",
                          "harga": 11000,
                          "image":
                              "https://images.unsplash.com/photo-1613653739328-e86ebd77c9c8?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Soto",
                          "harga": 15000,
                          "image":
                              "https://images.unsplash.com/photo-1572656631137-7935297eff55?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
                        },
                        {
                          "nama": "Ramen",
                          "harga": 16000,
                          "image":
                              "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGluZG9uZXNpYW4lMjBmb29kfGVufDB8fDB8fHww"
                        },
                      ];
                      var food = foods[index];
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          food["image"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          food["nama"],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "Rp ${NumberFormat("#,##0", "id_ID").format(food["harga"])}",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
