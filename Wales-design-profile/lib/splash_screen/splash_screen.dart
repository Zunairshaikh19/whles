import 'dart:async';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:flutter/material.dart';

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const OnBoardingMainPage() //ChooseLanguage(),
              ),
        );
      },
    );
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
