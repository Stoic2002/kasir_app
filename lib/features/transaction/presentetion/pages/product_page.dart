import 'package:flutter/material.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isRegular = false;
  bool isSpicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mie Ayam',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 260.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1612927601601-6638404737ce?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWllJTIwYXlhbXxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumlah",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.remove,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text('1'),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Type",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF6C63FF),
                              value: isRegular,
                              onChanged: (bool? value) {
                                setState(() {
                                  isRegular = value ?? false;
                                  if (isRegular) {
                                    isSpicy = false; // Uncheck the other option
                                  }
                                });
                              },
                            ),
                            Text('Reguler', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: isSpicy,
                              onChanged: (bool? value) {
                                setState(() {
                                  isSpicy = value ?? false;
                                  if (isSpicy) {
                                    isRegular =
                                        false; // Uncheck the other option
                                  }
                                });
                              },
                            ),
                            Text('Pedas', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      "Level Kepedasan",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.remove,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text('1'),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 14,
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              QButton(label: 'Checkout', onPressed: () => {}),
            ],
          ),
        ));
  }
}
