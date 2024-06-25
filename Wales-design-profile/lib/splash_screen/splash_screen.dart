import 'dart:async';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/home_screens/bottom_navigation.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        checkIfUserIsLoggedIn();
      },
    );
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Get.offAll(() => const BottomNavigation());
      return true;
    }else{
      Get.offAll(() => const OnBoardingMainPage());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Strings.splashLogo),
              fit: BoxFit.cover,
            ),
          ),
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
