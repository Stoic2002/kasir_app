import 'package:flutter/material.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/features/auth/presentetion/pages/login_page.dart';

class WelcomeScreen2Page extends StatefulWidget {
  const WelcomeScreen2Page({super.key});

  @override
  State<WelcomeScreen2Page> createState() => _WelcomeScreen2PageState();
}

class _WelcomeScreen2PageState extends State<WelcomeScreen2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Assets.images.splashScreen3.image(fit: BoxFit.cover)),
            const SizedBox(height: 70.0),
            const Text(
              "Mulai Sekarang",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "Bergabunglah untuk merasakan manfaat dari e-Kasir",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 40.0),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(width: 3.0),
                Container(
                  height: 5,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(width: 3.0),
                Container(
                  height: 5,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
