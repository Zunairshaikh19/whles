import 'package:app/home_screens/bottom_navigation.dart';
import 'package:app/models/public_profile_model.dart';
import 'package:app/models/trading_model.dart';
import 'package:app/profile/create_account.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../profile/forget_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_rich_text.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Global/variable.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isObscurePass = true;
  bool isButtonEnabled = false;
  bool loading = false;
  void goToForgetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const ForgetPassword();
        },
      ),
    );
  }

  void goToUserType() {
    Get.offAll(() => const BottomNavigation());
  }

  void login() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      Constants.showMessage(context, "Please fill all fields");
      return;
    }
    setState(() {
      loading = true;
    });

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    );

    if (userCredential.user != null) {
      await TradingModel.addingAlll();
      SaveduserId = userCredential.user!.uid;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userCredential.user!.uid);
      await prefs.setString('email', emailController.text);
      goToUserType();
    } else {
      Constants.showMessage(context, "Wrong Credentials");
    }
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('userId');
    // FirebaseFirestore firestore = FirebaseFirestore.instance;

    // DocumentSnapshot? userDoc;
    // if (userId != null) {
    //   // Retrieve user document by userId
    //   DocumentReference userDocRef = firestore.collection('users').doc(userId);
    //   userDoc = await userDocRef.get();
    // } else {
    //   // Retrieve user document by email if userId is null
    //   QuerySnapshot querySnapshot = await firestore
    //       .collection('users')
    //       .where('email', isEqualTo: emailController.text)
    //       .get();
    //   if (querySnapshot.docs.isNotEmpty) {
    //     userDoc = querySnapshot.docs.first;
    //   }
    // }

    // if (userDoc != null && userDoc.exists) {
    //   Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

    //   if (userData!['email'] == emailController.text &&
    //       userData['password'] == passController.text) {
    //     // Save userId to shared preferences
    //     await prefs.setString('userId', userDoc.id);
    //     await prefs.setString('email', emailController.text);

    //     Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (_) {
    //       return const CheckProfile();
    //     }), (route) => false);
    //   } else {
    //     Constants.showMessage(context, "Wrong Credentials");
    //   }
    // } else {
    //   Constants.showMessage(context, "User does not exist");
    // }
    setState(() {
      loading = false;
    });
  }

  // void login() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('userId');
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   DocumentReference userDocRef = firestore.collection('users').doc(userId);
  //   DocumentSnapshot userDoc = await userDocRef.get();
  //   if (userDoc.exists) {
  //     Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

  //     if (userData!['email'] == emailController.text &&
  //         userData['password'] == passController.text) {
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (_) {
  //         return const CheckProfile();
  //       }), (route) => false);
  //     } else {
  //       Constants.showMessage(context, "Wrong Credentials");
  //     }
  //   } else {
  //     Constants.showMessage(context, "user not exists");
  //   }
  //   // FirebaseAuth.instance
  //   //     .signInWithEmailAndPassword(
  //   //   email: emailController.text,
  //   //   password: passController.text,
  //   // )
  //   //     .then((value) {
  //   //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
  //   //     return const CheckProfile();
  //   //   }), (route) => false);
  //   // }).catchError((onError) {
  //   //   setState(() {
  //   //     loading = false;
  //   //   });
  //   //   Constants.showMessage(context, onError.message);
  //   // });
  // }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn() async {
    try {
      print("sssssssssssss 1");
      await _googleSignIn.signIn();
      print("sssssssssssss 2");
      GoogleSignInAccount? user = _googleSignIn.currentUser;
      PublicProfileModel profileModel = PublicProfileModel.empty();
      if (user != null) {
        profileModel.firstName = user.displayName ?? '';
        profileModel.email = user.email;
        profileModel.profileUrl =
            user.photoUrl ?? 'https://www.w3schools.com/howto/img_avatar.png';
        profileModel.id = user.id;
        await PublicProfileModel.addPublicProfile(profileModel);
        SaveduserId = user.id;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.id);
        await prefs.setString('email', user.email);
      } else {
       Get.snackbar("Alert", 'User not found');
      }
      goToUserType();
    } catch (error) {
      Get.snackbar('Error', '$error');
    }
  }

  handleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    await googleSignIn.signOut();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                prefixIcon: '',
                hintText: 'Email Address',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passController,
                hintText: 'Password',
                hintTextColor: Colors.white,
                prefixIcon: '',
                isPass: true,
                textInputType: TextInputType.visiblePassword,
                isObscure: isObscurePass,
                widget: (IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePass = !isObscurePass;
                      });
                    },
                    icon: isObscurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppTheme.kCustomTextOrColor,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Colors.white,
                          ))),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: goToForgetPassword,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: login,
                text: loading ? "Signing in...." : "Sign In",
                fontColorAlt: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomRichText(
                leftText: "Don't Have An Account? ",
                leftTextColor: AppTheme.whiteColor,
                leftFontSize: 14,
                rightText: "Sign up",
                rightTextColor: AppTheme.whiteColor,
                rightFontSize: 14,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreateAccount("User") //SignUpView(),
                        ),
                  );
                },
              ),
              Row(children: <Widget>[
                const Expanded(
                    child: Divider(
                  color: AppTheme.kCustomDividerColor,
                  thickness: 1,
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Or",
                    style: TextStyle(color: AppTheme.whiteColor),
                  ),
                ),
                const Expanded(
                    child: Divider(
                  color: AppTheme.kCustomDividerColor,
                )),
              ]),
              CustomButton(
                isButtonEnable: true,
                height: 56,
                onPress: goToUserType,
                text: "Continue with Apple",
                fontColor: AppTheme.whiteColor,
                fontSize: 16,
                image: 'assets/ant-design_apple-filled.png',
                showImage: true,
                fontWeight: FontWeight.w500,
                containerColor: AppTheme.transparentColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                isButtonEnable: true,
                height: 56,
                onPress: _handleSignIn,
                text: "Continue with Google",
                fontColor: AppTheme.whiteColor,
                fontSize: 16,
                image: 'assets/flat-color-icons_google.png',
                showImage: true,
                fontWeight: FontWeight.w500,
                containerColor: AppTheme.transparentColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                isButtonEnable: true,
                height: 56,
                onPress: goToUserType,
                text: "Continue with Facebook",
                fontColor: AppTheme.whiteColor,
                fontSize: 16,
                image: 'assets/logos_facebook.png',
                showImage: true,
                fontWeight: FontWeight.w500,
                containerColor: AppTheme.transparentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
