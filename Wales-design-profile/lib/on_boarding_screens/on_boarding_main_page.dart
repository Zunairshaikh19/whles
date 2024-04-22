import 'dart:async';
import 'package:app/on_boarding_screens/on_boarding_screen_one.dart';
import 'package:app/on_boarding_screens/on_boarding_screen_three.dart';
import 'package:app/on_boarding_screens/on_boarding_screen_two.dart';
import 'package:app/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class OnBoardingMainPage extends StatefulWidget {
  const OnBoardingMainPage({super.key});

  @override
  State<OnBoardingMainPage> createState() => _OnBoardingMainPageState();
}

class _OnBoardingMainPageState extends State<OnBoardingMainPage> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;
  int index = 0;
  int currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (_activePage < 4) {
          _activePage++;
        } else {
          _activePage = 0;
        }
        _pageViewController.animateToPage(
          _activePage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose(); // dispose the PageController
    _timer.cancel();
  }

  // void goToSignUp() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return const SignUp();
  //       },
  //     ),
  //   );
  // }

  List<Widget> pages = [
    const OnBoardingScreenOne(),
    const OnBoardingScreenTwo(),
    const OnBoardingScreenThree()
  ];
  void goToWelcomeScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const WelcomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4A635F),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    _activePage = index;
                    currentPage = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return pages[index];
                }),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff3F5753),
                      Color(0xfff3E5753),
                    ], // Colors for the gradient
                    begin:
                        Alignment.topCenter, // Starting point of the gradient
                    end: Alignment.bottomCenter, // Ending point of the gradient
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const Text(
                        'Lorem Ipsum is simply\ndummy text of the printing\nand typesetting industry.',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: goToWelcomeScreen,
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: AppTheme.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                  pages.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: InkWell(
                                          onTap: () {
                                            _pageViewController.animateToPage(
                                                index,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeIn);
                                          },
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: _activePage ==
                                                    index
                                                ? AppTheme.kCustomButtonColor
                                                : Colors.grey,
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_activePage < 2) {
                                setState(() {
                                  _activePage++;
                                });
                              } else {
                                goToWelcomeScreen();
                              }
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: AppTheme.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
