import 'dart:async';

import 'package:app/constants.dart';
import 'package:app/home_screens/accounts.dart';
import 'package:app/on_boarding_screens/on_boarding_main_page.dart';
import 'package:app/profile/documents/document_view.dart';
import 'package:app/profile/faq/faq_view.dart';
import 'package:app/profile/feedback/main_feedback_view.dart';
import 'package:app/profile/logout/logout.dart';
import 'package:app/profile/notification/notification_view.dart';
import 'package:app/profile/views/legal_profile_view.dart';
import 'package:app/profile/views/personal_profile_view.dart';
import 'package:app/profile/views/user_profile_view.dart';
import 'package:app/profile/views/verify_profile_view.dart';
import 'package:app/widgets/profile_cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  String uid = '';
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    _debounce?.cancel();
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
    'assets/Feedback.png',
    'assets/bankAccount.png',
  ];
  List<Widget> profileScreens = [
    const PersonalProfileView(),
    const LegalProfileView(),
    const Accounts(),
    const DocumentView(),
    const NotificationView(),
    const FaqView(),
    const MainFeedbackView(),
    const Logout()
  ];
  List<String> profileTitles = [
    'Personal Profile',
    'Legal Profile',
    'Bank Account',
    'Documents',
    'Help',
    'FAQs',
    'Feedback',
    'Logout'
  ];
  Timer? _debounce;

  List<String> profileSubtitles = [
    'View user profile',
    'Complete setup',
    'Complete setup',
    'Statement . Taxes. Legals',
    'Contact Support',
    'Find answers to commonly asked questions',
    'Give feedback on our app',
    'Logout from the app'
  ];

  void logout() async {
    googleSignIn.isSignedIn().then((value) {
      if (value) {
        googleSignIn.signOut();
        signOut();
        SharedPreferences? prefs = Constants.prefs;
        prefs!.clear();
      }else{
        FirebaseAuth.instance.signOut().then((value) async {
          signOut();
          SharedPreferences? prefs = Constants.prefs;
          prefs!.clear();
        }).catchError((onError) {});
      }
    });
    
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

  void goToAccounts(BuildContext context, int index) {
    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => profileScreens[index]));
    });
  }

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';
      profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      uid = prefs.getString("userId") ?? '';
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
        return userDoc.data()
            as Map<String, dynamic>?; // Cast to the correct type
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserDataFromEmail(String email) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user data by email: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? userEmail = prefs.getString('email');

    if (userId != null && userId.isNotEmpty) {
      // Retrieve user data by userId
      return getUserDataFromFirestore(userId);
    } else if (userEmail != null && userEmail.isNotEmpty) {
      // Retrieve user data by email
      return getUserDataFromEmail(userEmail);
    } else {
      return null;
    }
  }

  Future<bool> checkUserAlreadyApplied() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';
    print('Checking if user already applied with userId: $userId');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference snapshot =
        await firestore.collection('onBoarding').doc(userId);

    return snapshot.get().then((doc) {
      return doc.exists;
    }).catchError((e) {
      print('Error checking if user already applied: $e');
      return false;
    });
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                            userData.containsKey('profileUrl')) {
                          String profilePictureUrl = userData['profileUrl'];
                          return profilePictureUrl.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    profilePictureUrl,
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              : Text("No Image");
                        } else {
                          // Show default image if profile picture URL is not available
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: profileUrl != null || profileUrl.isNotEmpty
                                ? Image.asset(
                                    profileUrl,
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  )
                                : Text("No Image"),
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
                          userData.containsKey('firstName')) {
                        String displayName =
                            "${userData['firstName']} ${userData['lastName']}";
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
                  bool alreadyApplied = await checkUserAlreadyApplied();
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
                    onTap: () => setState(() {
                      goToAccounts(context, index);
                    }),
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
      ),
    );
  }
}
