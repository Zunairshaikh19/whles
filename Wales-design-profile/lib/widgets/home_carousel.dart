import 'dart:async';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'carousel_container.dart';

class HomeCarousel extends StatefulWidget {
  final double? containerSize;
  List<String> bannerList;
  HomeCarousel(this.containerSize, this.bannerList, {super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int activePage = 0;
  late Timer timer;

  List<String> titleList = [
    "Community",
    "Freelancer",
    "Real Estate",
    "Services",
  ];
  List<String> subtitleList = [
    "Yorem ipsum dolor sit amet, consectur adipiscing elit, Nunc vulpulate libero et velit interdum",
    "Yorem ipsum dolor sit amet, consectur adipiscing elit, Nunc vulpulate libero et velit interdum",
    "Yorem ipsum dolor sit amet, consectur adipiscing elit, Nunc vulpulate libero et velit interdum",
    "Yorem ipsum dolor sit amet, consectur adipiscing elit, Nunc vulpulate libero et velit interdum",
  ];
  List<String> buttonTitleList = [
    "View Now",
    "View Now",
    "View Now",
    "View Now",
  ];

  // List<String> bannerList = [
  //   'assets/Group67.png',
  //   'assets/Group67.png',
  //   'assets/Group67.png',
  //   'assets/Group67.png',
  //   'assets/Group67.png',
  //   // 'assets/join_community.png',
  //   // 'assets/images/image_30.png',
  //   // 'assets/images/image_28.png',
  //   // 'assets/images/image_31.png',
  //   // 'assets/images/image_32.png',
  // ];
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (activePage < 5) {
        activePage++;
      } else {
        activePage = 0;
      }

      _pageViewController.animateToPage(
        activePage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose(); // dispose the PageController
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      reverse: true,
      allowImplicitScrolling: true,
      controller: _pageViewController,
      onPageChanged: (index) {
        setState(
          () {
            activePage = index;
          },
        );
      },
      itemCount: widget.bannerList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            CarouselContainer(
              containerSize: widget.containerSize,
              // title: titleList[index],
              // subtitle: subtitleList[index],
              // tapped: () {},
              // buttonTitle: buttonTitleList[index],
              // containerColor: containerColorList[index],
              // buttonColor: buttonColorList[index],
              banner: widget.bannerList[index],
              // curve: true,
            ),
          ],
        );
      },
    );
  }
}
