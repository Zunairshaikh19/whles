import 'package:app/constants.dart';
import 'package:app/constants/typography.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  bool isFeedback = true;

   void logout() async {
    FirebaseAuth.instance.signOut().then((value) async {
      signOut();
      SharedPreferences? prefs =  Constants.prefs;
      prefs!.clear();
      
    }).catchError((onError) {});
  }

  void signOut() async {
   Get.offAll(() => const OnBoardingMainPage());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 350),
              Center(
                child: CustomButton(
                  text: 'Logout',
                  onPress: logout,
                  width: 200,
                  containerColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
