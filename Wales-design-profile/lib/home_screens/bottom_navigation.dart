import 'package:app/home_screens/crypto.dart';
import 'package:app/home_screens/profile.dart';
import 'package:app/home_screens/wallet.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const Crypto(),
    const Home(),
    const Wallet(),
    const Profile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: _onItemTapped,
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Image(
              image: ExactAssetImage(
                'assets/home.png',
              ),
            ),
            activeIcon: Image(
              image: const ExactAssetImage(
                'assets/home.png',
              ),
              color: AppTheme.blackColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Image(
              image: ExactAssetImage(
                'assets/stock-market1.png',
              ),
            ),
            activeIcon: Image(
              image: const ExactAssetImage(
                'assets/stock-market1.png',
              ),
              color: AppTheme.blackColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Image(
              image: ExactAssetImage(
                'assets/globe1.png',
              ),
            ),
            activeIcon: Image(
              image: const ExactAssetImage(
                'assets/globe1.png',
              ),
              color: AppTheme.blackColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Image(
              image: ExactAssetImage(
                'assets/wallet1.png',
              ),
            ),
            activeIcon: Image(
              image: const ExactAssetImage(
                'assets/wallet1.png',
              ),
              color: AppTheme.blackColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Image(
              image: ExactAssetImage(
                'assets/profile-icon.png',
              ),
            ),
            activeIcon: Image(
              image: const ExactAssetImage(
                'assets/profile-icon.png',
              ),
              color: AppTheme.blackColor,
            ),
            label: "",
          ),
        ],
        // backgroundColor: whiteColor.withOpacity(0.8),
        // selectedItemColor: newCoolBlueColor,
        // unselectedItemColor: blackTypeColor,
        selectedLabelStyle: const TextStyle(fontFamily: 'DM Sans'),
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
    );
  }
}
