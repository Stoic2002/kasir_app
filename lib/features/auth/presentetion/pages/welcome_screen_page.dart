import 'package:flutter/material.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/features/auth/presentetion/pages/welcome_screen1_page.dart';

class WelcomeScreenPage extends StatefulWidget {
  const WelcomeScreenPage({super.key});

  @override
  State<WelcomeScreenPage> createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Assets.images.splashScreen1.image(fit: BoxFit.cover)),
            const SizedBox(height: 70.0),
            const Text(
              "Selamat Datang di e-Kasir!",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "Solusi Cerdas untuk Usaha Anda",
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
                    color: Colors.black,
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
                    color: Colors.blue,
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
                          builder: (context) => const WelcomeScreen1Page()),
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
