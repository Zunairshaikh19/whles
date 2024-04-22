import 'package:app/Global/variable.dart';
import 'package:app/constants.dart';
import 'package:app/widgets/accounts_tiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';
import '../on_boarding_screens/on_boarding_main_page.dart';
import '../widgets/custom_button.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  String name = '';
  String profileUrl = '';
  List<String> titles = [
    'Personal Information',
    'Investment Profile',
    'Verify your identity',
  ];
  List<String> subtitles = [
    'Basic information to create your account',
    'Determining your investing goals',
    'Required by U.S financial regulatory laws'
  ];
  List<String> trailing = ['Complete Setup', '', ''];
  void logout() async {
    FirebaseAuth.instance.signOut().then((value) async {
      // ignore: await_only_futures
      SharedPreferences? prefs = await Constants.prefs;
      prefs!.clear();
      signOut();
    }).catchError((onError) {});
  }

  void signOut() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return const OnBoardingMainPage();
        },
      ),
    );
  }

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();

    setState(() {
      name = prefs.getString("name") ?? '';
      profileUrl = prefs.getString("profileURL") ?? Constants.noImage;
    });
  }

  Future<void> deleteUser() async {
    try {
      // 1. Delete corresponding document from Firestore
      GoogleSignIn user = GoogleSignIn(scopes: ['email']);
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      GoogleSignInAccount? userData = user.currentUser;
      String userId = userData!.id;
      DocumentReference userDocRef = firestore.collection('users').doc(userId);
      await userDocRef.delete();
      print('User document deleted from Firestore');
      // 2. Delete user from Firebase Authentication

      if (user != null) {
        await user.disconnect();
        print('User deleted from Firebase Authentication');
      } else {
        print('No user signed in');
        return;
      }
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.greyColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppTheme.blackColor,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Accounts',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return AccountTiles(
                      title: titles[index],
                      subtitle: subtitles[index],
                      trailing: trailing[index]);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  isButtonEnable: false,
                  height: 56,
                  onPress: logout,
                  text: "Log Out",
                  fontSize: 16,
                  fontColor: AppTheme.blackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  isButtonEnable: true,
                  height: 56,
                  onPress: deleteUser,
                  text: "Delete account",
                  fontSize: 16,
                  fontColor: AppTheme.blackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  containerColor: AppTheme.whiteColor,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
