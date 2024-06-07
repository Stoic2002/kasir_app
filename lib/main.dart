import 'package:flutter/material.dart';
import 'package:kasir_app/features/auth/presentetion/pages/splash_screen_page.dart';
import 'package:kasir_app/features/auth/presentetion/pages/welcome_screen_page.dart';

void main() async {
  runMainApp();
}

runMainApp() async {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.of(context).pushReplacementNamed('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Kasir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreenPage(),
      onGenerateRoute: (routeSettings) {
        print(routeSettings.name);
        return null;
      },
    );
  }
}
