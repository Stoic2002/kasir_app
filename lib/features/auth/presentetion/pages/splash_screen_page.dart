import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    openHome();
  }

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

  openHome() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get()
              .then((DocumentSnapshot snap) {
            if (snap.exists) {
              context.goNamed(RouteConstants.root,
                  pathParameters: PathParameters().toMap());
            }
          });
        } else {
          context.goNamed(RouteConstants.login);
        }
      },
    );
  }
}
