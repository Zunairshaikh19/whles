import 'package:app/home_screens/bottom_navigation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../camera/add_photo.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CreateAgentProfile extends StatefulWidget {
  const CreateAgentProfile({super.key});

  @override
  State<CreateAgentProfile> createState() => _CreateAgentProfileState();
}

class _CreateAgentProfileState extends State<CreateAgentProfile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController companyWebsiteController =
      TextEditingController();
  bool isObscurePass = true;
  bool isObscureConfirmPass = true;
  bool isButtonEnabled = false;
  bool loading = false;

  String profileUrl = "";

  void registerUser() async {
    if (loading) {
      return;
    }

    navHome();

    // User? user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   return;
    // }
    // setState(() {
    //   loading = true;
    // });
    // await FirebaseFirestore.instance.collection('profile').doc(user.uid).set(
    //   {
    //     'companyName': companyNameController.text.trim(),
    //     'companyWebsite': companyWebsiteController.text.trim(),
    //     'email': emailController.text.trim(),
    //     'contactPerson': contactPersonController.text.trim(),
    //     'role': 'realEstateAgent',
    //     'profileUrl': profileUrl,
    //   },
    //   SetOptions(merge: true),
    // ).then((value) async {
    //   navHome();
    // });
    // setState(() {
    //   loading = false;
    // });
  }

  bool checkCredentials() {
    bool result = false;
    if (companyNameController.text.isEmpty) {
      Constants.showMessage(context, "Please add company name");
    } else if (profileUrl.isEmpty) {
      Constants.showMessage(context, "Please upload company logo");
    } else if (companyWebsiteController.text.isEmpty) {
      Constants.showMessage(context, "Please enter company website");
    } else if (contactPersonController.text.isEmpty) {
      Constants.showMessage(context, "Please enter contact person");
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
                controller: companyNameController,
                prefixIcon: '',
                hintText: 'Company Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: contactPersonController,
                prefixIcon: '',
                hintText: 'Contact person',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: companyWebsiteController,
                prefixIcon: '',
                hintText: 'Company website',
                hintTextColor: Colors.white,
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
