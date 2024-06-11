import 'package:flutter/material.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/core/constants/app_colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(30.0),
        child:
            Center(child: Assets.images.splashScreen.image(fit: BoxFit.cover)),
      ),
    );
  }
}
