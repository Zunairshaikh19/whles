// ignore_for_file: avoid_print
import 'package:app/constants.dart';
import 'package:app/home_screens/bottom_navigation.dart';
import 'package:app/models/estate_agent_profile_model.dart';
import 'package:app/models/public_profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin/dashboard.dart';

class CheckProfile extends StatefulWidget {
  const CheckProfile({super.key});

  @override
  State<CheckProfile> createState() => _CheckProfileState();
}

class _CheckProfileState extends State<CheckProfile> {
  bool loading = false;
  String accountType = "";

  @override
  void initState() {
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    goToHome();

    //   User? user = FirebaseAuth.instance.currentUser;
    //   SharedPreferences prefs = await Constants.getPrefs();
    //   if (user != null) {
    //     PublicProfileModel? profile =
    //         await PublicProfileModel.getPublicProfile(user.uid);
    //     EstateAgentProfileModel? agentProfile =
    //         await EstateAgentProfileModel.getPublicProfile(user.uid);

    //     if (profile != null) {
    //       if (profile.role == 'user') {
    //         prefs.setString("firstName", profile.firstName);
    //         prefs.setString("lastName", profile.lastName);
    //         prefs.setString("phoneNo", profile.phoneNo);
    //         prefs.setString("email", profile.email);
    //         prefs.setString("profileUrl", profile.profileUrl);
    //         goToHome();
    //       } else if (user.uid == "Pc9SBSvzlZaLzloGWyGJQQ0paCi1") {
    //         if (profile.role == 'admin') {
    //           prefs.setString("firstName", profile.firstName);
    //           prefs.setString(
    //             "lastName",
    //             profile.lastName,
    //           );

    //           prefs.setString(
    //             'profileUrl',
    //             profile.profileUrl,
    //           );
    //           prefs.setString("email", profile.email);

    //           goToDashboard();
    //         }
    //       }
    //     } else if (agentProfile != null) {
    //       if (agentProfile.role == 'realEstateAgent') {
    //         prefs.setString("companyName", agentProfile.companyName);
    //         prefs.setString("companyWebsite", agentProfile.companyWebsite);
    //         prefs.setString("email", agentProfile.email);
    //         prefs.setString("profileUrl", agentProfile.profileUrl);
    //       }
    //       goToHome();
    //     }
    //   }
  }

  void goToDashboard() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (_) {
        return const Dashboard();
      },
    ), (route) => false);
  }

  void goToHome() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (_) {
        return const BottomNavigation();
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()));
  }
}
