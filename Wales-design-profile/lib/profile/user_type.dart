// ignore_for_file: avoid_print
import 'package:app/profile/create_agent_account.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'create_account.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  var currentIndex = 0;
  bool cont = false;

  bool isButtonEnabled = false;
  String userType = '';
  List userTypeList = [
    'Real Estate Agent',
    'User',
  ];
  void abc() {}

  // void next(String type) {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null && userType.isNotEmpty) {
  //     FirebaseFirestore.instance
  //         .collection("profile")
  //         .doc(user.uid)
  //         .set({'userType': userType}, SetOptions(merge: true)).then(
  //             (value) async {
  //       SharedPreferences prefs = await Constants.getPrefs();
  //       prefs.setString("userType", userType);
  //       Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     if (type == "BUYER") {
  //       return const Profile();
  //     } else {
  //       return const AgencyProfile();
  //     }
  //   }));
  //     }).catchError((onError) {
  //       print(onError.toString());
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Please Select The User Type"),
  //     ));
  //     }
  // }
  void goToCreateAccount() {
    if (userType == "User") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return CreateAccount(userType);
          },
        ),
      );
    } else if (userType == "Real Estate Agent") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return CreateAgentAccount(userType);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4A635F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.whiteColor,
            size: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Type',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              children(userTypeList[0], 0),
              children(userTypeList[1], 1),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: goToCreateAccount,
                text: "Sign In",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget children(String text, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: 56,
        decoration: currentIndex == index
            ? BoxDecoration(
                border: Border.all(color: AppTheme.whiteColor),
              )
            : BoxDecoration(
                border: Border.all(width: 0),
              ),
        child: TextButton(
          onPressed: () {
            setState(() {
              currentIndex = index;
              userType = userTypeList[currentIndex];
              currentIndex == index ? cont = true : cont = false;
            });
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: currentIndex == index
                  ? AppTheme.whiteColor
                  : AppTheme.whiteColor,
              letterSpacing: 0.35,
            ),
          ),
        ),
      ),
    );
  }
}
