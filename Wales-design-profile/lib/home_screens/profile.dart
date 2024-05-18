import 'package:app/constants.dart';
import 'package:app/home_screens/accounts.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:app/profile/documents/document_view.dart';
import 'package:app/profile/faq/faq_view.dart';
import 'package:app/profile/feedback/main_feedback_view.dart';
import 'package:app/profile/notification/notification_view.dart';
import 'package:app/profile/views/user_profile_view.dart';
import 'package:app/profile/views/verify_profile_view.dart';
import 'package:app/widgets/profile_cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global/variable.dart';
import '../app_theme.dart';
import '../constants/typography.dart';
import '../widgets/custom_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String profileUrl = '';

  @override
  void initState() {
    super.initState();
    userDataFuture = getUserData();
  }

  void getPicture(String url) {
    setState(() {
      profileUrl = url;
    });
  }

  List<String> images = [
    'assets/profile.png',
    'assets/profile.png',
    'assets/bankAccount.png',
    'assets/documents-folder.png',
    'assets/message-question.png',
    'assets/FAQ.png',
    'assets/Feedback.png'
  ];
  List<Widget> profileScreens = [
    const UserProfileView(),
    const Accounts(),
    const Accounts(),
    const DocumentView(),
    const NotificationView(),
    const FaqView(),
    const MainFeedbackView()
  ];
  List<String> profileTitles = [
    'View Profile',
    'Account',
    'Bank Account',
    'Documents',
    'Help',
    'FAQs',
    'Feedback',
  ];
  List<String> profileSubtitles = [
    'View user profile',
    'Complete setup',
    'Complete setup',
    'Statement . Taxes. Legals',
    'Contact Support',
    'Find answers to commonly asked questions',
    'Give feedback on our app'
  ];

  void logout() async {
    // FirebaseAuth.instance.signOut().then((value) async {
    //   // ignore: await_only_futures
    //   SharedPreferences? prefs = await Constants.prefs;
    //   prefs!.clear();
    //   signOut();
    // }).catchError((onError) {});
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

  void goToAccounts(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return profileScreens[index];
        },
      ),
    );
  }

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';

      profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      email = prefs.getString("email") ?? '';
    });
  }

  late Future<Map<String, dynamic>?> userDataFuture;

  Future<Map<String, dynamic>?> getUserDataFromFirestore(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = firestore.collection('users').doc(userId);
      DocumentSnapshot userDoc = await userDocRef.get();

      if (userDoc.exists) {
        print(userDoc.data());
        return userDoc.data()
            as Map<String, dynamic>?; // Cast to the correct type
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    String userId = SaveduserId;

    return getUserDataFromFirestore(userId);
  }

  Future<bool> checkUserAlreadyApplied(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore
        .collection('onBoarding')
        .where('userId', isEqualTo: userId)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  void showAlreadyAppliedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Already Applied'),
          content: Text('You have already applied.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.greyColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 54,
              child: FutureBuilder<Map<String, dynamic>?>(
                future: userDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show a loading indicator while waiting for user data
                  } else {
                    if (snapshot.hasError) {
                      return Text(
                        'Error fetching data',
                        style: poppinsMedium.copyWith(fontSize: 24),
                      );
                    } else {
                      // Extracting profile picture URL from user data
                      Map<String, dynamic>? userData = snapshot.data;
                      if (userData != null &&
                          userData.containsKey('profilePicture')) {
                        String profilePictureUrl = userData['profilePicture'];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            profilePictureUrl,
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                          ),
                        );
                      } else {
                        // Show default image if profile picture URL is not available
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            profileUrl,
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                          ),
                        );
                      }
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder<Map<String, dynamic>?>(
              future: userDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    'Loading...',
                    style: poppinsMedium.copyWith(fontSize: 24),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Text(
                      'Error fetching data',
                      style: poppinsMedium.copyWith(fontSize: 24),
                    );
                  } else {
                    // Extracting displayName from user data
                    Map<String, dynamic>? userData = snapshot.data;
                    if (userData != null &&
                        userData.containsKey('displayName')) {
                      String displayName = userData['displayName'];
                      return Text(
                        displayName,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: AppTheme.blackColor),
                      );
                    } else {
                      return Text(
                        'No display name found',
                        style: poppinsMedium.copyWith(fontSize: 24),
                      );
                    }
                  }
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<Map<String, dynamic>?>(
              future: userDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    'Loading...',
                    style: poppinsMedium.copyWith(fontSize: 24),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Text(
                      'Error fetching data',
                      style: poppinsMedium.copyWith(fontSize: 24),
                    );
                  } else {
                    // Extracting email from user data
                    Map<String, dynamic>? userData = snapshot.data;
                    if (userData != null && userData.containsKey('email')) {
                      String email = userData['email'];
                      return Text(
                        email,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: AppTheme.kCustomnavGrayColor),
                      );
                    } else {
                      return Text(
                        'No email found',
                        style: poppinsMedium.copyWith(fontSize: 24),
                      );
                    }
                  }
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              isButtonEnable: true,
              height: 34,
              radius: 26,
              width: 150,
              onPress: () async {
                bool alreadyApplied =
                    await checkUserAlreadyApplied(SaveduserId);
                if (alreadyApplied) {
                  showAlreadyAppliedDialog();
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const VerifyProfileView();
                      },
                    ),
                  );
                }
              },
              text: "Complete setup",
              fontSize: 12,
              fontColor: AppTheme.blackColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              containerColor: AppTheme.whiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => goToAccounts(index),
                  child: ProfileCards(
                    image: images[index],
                    title: profileTitles[index],
                    subtitle: profileSubtitles[index],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
