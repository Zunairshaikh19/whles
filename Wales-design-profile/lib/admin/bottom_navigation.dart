import 'package:app/admin/users.dart';
import 'package:app/app_theme.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersBottomNavigation extends StatefulWidget {
  const UsersBottomNavigation({Key? key}) : super(key: key);

  @override
  State<UsersBottomNavigation> createState() => _UsersBottomNavigationState();
}

class _UsersBottomNavigationState extends State<UsersBottomNavigation> {
  int index = 0;
  List<dynamic> users = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  String firstName = '';
  String lastName = '';
  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';

      // profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      // email = prefs.getString("email") ?? '';
    });
  }

  Widget getBody() {
    if (index == 0) {
      return const Users();
    } else if (index == 1) {
      return const Users();
    } else {
      return const Center(
        child: Text('Body'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyShadeColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppTheme.whiteColor,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Users',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        actions: [
          Text(
            'English',
            style: TextStyle(fontSize: 14, color: AppTheme.whiteColor),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/bell.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/search.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$firstName $lastName",
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
              Text(
                'Available',
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/account1.png'),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: AppTheme.raisinColor,
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: index,
        onTap: (i) {
          setState(
            () {
              index = i;
            },
          );
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/userPic.png',
              width: 25,
              height: 25,
              color: AppTheme.blackColor,
            ),
            activeIcon: Image.asset(
              'assets/userPic.png',
              width: 25,
              height: 25,
            ),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/shareholder.png',
              color: AppTheme.blackColor,
              width: 25,
              height: 25,
            ),
            activeIcon: Image.asset(
              'assets/shareholder.png',
              color: AppTheme.blackColor,
              width: 25,
              height: 25,
            ),
            label: "Real Estate Agent",
          ),
        ],
        selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
    );
  }
}
