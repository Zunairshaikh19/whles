import 'package:app/home_screens/bottom_navigation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../camera/add_photo.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CreateUserProfile extends StatefulWidget {
  const CreateUserProfile({super.key});

  @override
  State<CreateUserProfile> createState() => _CreateUserProfileState();
}

class _CreateUserProfileState extends State<CreateUserProfile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  bool isObscurePass = true;
  bool isObscureConfirmPass = true;
  bool isButtonEnabled = false;
  bool loading = false;
  String profileUrl = '';
  void registerUser() async {
    if (loading) {
      return;
    }

    // User? user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   return;
    // }
    // setState(() {
    //   loading = true;
    // });
    // await FirebaseFirestore.instance.collection('profile').doc(user.uid).set(
    //   {
    //     'firstName': firstNameController.text.trim(),
    //     'lastName': lastNameController.text.trim(),
    //     'phoneNo': phoneNoController.text.trim(),
    //     'role': 'user',
    //     "profileUrl": profileUrl,
    //     'email': emailController.text.trim(),
    //   },
    //   SetOptions(merge: true),
    // ).then((value) async {
    //   navHome();
    // });
    // setState(() {
    //   loading = false;
    // });
    navHome();
  }

  bool checkCredentials() {
    bool result = false;
    if (firstNameController.text.isEmpty) {
      Constants.showMessage(context, "Please add first name");
    } else if (lastNameController.text.isEmpty) {
      Constants.showMessage(context, "Please enter last name");
    } else if (phoneNoController.text.isEmpty) {
      Constants.showMessage(context, "Please enter phoneNo");
    } else if (emailController.text.isEmpty) {
      Constants.showMessage(context, "Please enter email");
    } else {
      result = true;
    }
    return result;
  }

  void navHome() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
      return const BottomNavigation();
    }), (route) => false);
  }

  void getPicture(String url) {
    setState(() {
      profileUrl = url;
    });
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AddPhoto(getPicture),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: firstNameController,
                prefixIcon: '',
                hintText: 'First Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: lastNameController,
                prefixIcon: '',
                hintText: 'Last Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: phoneNoController,
                prefixIcon: '',
                hintText: '+9123456788',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: emailController,
                prefixIcon: '',
                hintText: 'email',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: registerUser,
                text: "Sign Up",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
