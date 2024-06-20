import 'package:app/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    // Ensure initialization is done before any navigation operation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add any additional initialization if necessary
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Offering MarketPlace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getCurrentTheme(isDark),
      home: const SplashScreen(),
    );
  }
}
