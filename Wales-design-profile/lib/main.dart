import 'package:app/check_profile.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:app/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
  late Future getAppFuture;

  @override
  void initState() {
    // getAppFuture = getApp();
    super.initState();
  }

  // Future<FirebaseApp> getApp() async {
  //   FirebaseApp initialization = await Firebase.initializeApp();
  //   return initialization;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Offering MarketPlace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getCurrentTheme(isDark),
      home: const SplashScreen(),
      // FutureBuilder(
      //   future: getAppFuture,
      //   builder: (context, appSnapshot) {
      //     if (appSnapshot.connectionState == ConnectionState.done) {
      //       return StreamBuilder(
      //           stream: FirebaseAuth.instance.authStateChanges(),
      //           builder: (context, userSnapshot) {
      //             if (userSnapshot.connectionState == ConnectionState.active) {
      //               if (userSnapshot.hasData) {
      //                 return const
      //                     // MyHomePage(
      //                     //   title: "Increment",
      //                     // );
      //                     CheckProfile();
      //               } else {
      //                 return const OnBoardingMainPage();
      //               }
      //             } else {
      //               return const Scaffold(
      //                   body: Center(
      //                       child: CircularProgressIndicator.adaptive()));
      //             }
      //           });
      //     } else {
      //       return const Scaffold(
      //           body: Center(child: CircularProgressIndicator.adaptive()));
      //     }
      //   },
      // ),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
