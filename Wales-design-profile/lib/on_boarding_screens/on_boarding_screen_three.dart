import 'package:flutter/material.dart';

class OnBoardingScreenThree extends StatefulWidget {
  const OnBoardingScreenThree({super.key});

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenThreeState();
}

class _OnBoardingScreenThreeState extends State<OnBoardingScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4A635F),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 586,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  'assets/interior.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
