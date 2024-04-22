import 'package:app/app_theme.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController oldPasscontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();
  TextEditingController confirmPasscontroller = TextEditingController();
  String firstName = '';
  String lastName = '';
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  void goTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ProfileInfo();
    }));
  }

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';

      // profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      // email = prefs.getString("email") ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.raisinColor,
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
          'Profile',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        actions: [
          Text(
            'English',
            style: TextStyle(fontSize: 14, color: AppTheme.whiteColor),
          ),
          const SizedBox(
            width: 5,
          ),
          const Image(
            image: ExactAssetImage('assets/bell.png'),
          ),
          const SizedBox(
            width: 5,
          ),
          const Image(
            image: ExactAssetImage('assets/search.png'),
          ),
          const SizedBox(
            width: 5,
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
            width: 5,
          ),
          GestureDetector(
            onTap: goTo,
            child: const Image(
              image: ExactAssetImage('assets/account1.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Image(
                image: ExactAssetImage(
                  'assets/userPic.png',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Profile info',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailcontroller,
                prefixIcon: '',
                hintText: 'Username',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordcontroller,
                prefixIcon: '',
                hintText: 'Password',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: oldPasscontroller,
                prefixIcon: '',
                hintText: 'Old Password',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: newPasscontroller,
                prefixIcon: '',
                hintText: 'New Password',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: confirmPasscontroller,
                prefixIcon: '',
                hintText: 'Confirm Password',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                isButtonEnable: false,
                height: 56,
                width: MediaQuery.of(context).size.width / 1.2,
                onPress: () {},
                text: "Save Changes",
                fontSize: 16,
                fontColor: AppTheme.blackColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
