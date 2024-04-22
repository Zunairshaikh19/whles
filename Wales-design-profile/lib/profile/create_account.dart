import 'package:app/home_screens/bottom_navigation.dart';
import 'package:app/profile/create_user_profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CreateAccount extends StatefulWidget {
  final String userType;
  const CreateAccount(this.userType, {super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
  void register() {
    bool check = checkCredentials();
    if (!check) {
      return;
    } else {
      goTo();
    }
    // setState(() {
    //   loading = true;
    // });
    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //   email: emailController.text.trim(),
    //   password: passController.text,
    // )
    //     .then((value) {
    //   setState(() {
    //     loading = false;
    //   });
    //   goTo();
    // }).catchError((onError) {
    //   Constants.showMessage(context, onError.message.toString());
    // });
  }

  void goTo() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
      return const BottomNavigation();
    }), (route) => false);
  }

  bool checkCredentials() {
    bool result = false;
    if (emailController.text.isEmpty) {
      Constants.showMessage(context, "Please enter email");
    } else if (passController.text.isEmpty) {
      Constants.showMessage(context, "Please enter password");
    } else if (confirmPassController.text.isEmpty) {
      Constants.showMessage(context, "Please enter confirm password");
    } else if (passController.text != confirmPassController.text) {
      Constants.showMessage(context, "Password do not match");
    } else {
      result = true;
    }
    return result;
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
              CustomTextField(
                // controller: emailController,
                prefixIcon: '',
                hintText: 'First Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                // controller: emailController,
                prefixIcon: '',
                hintText: 'Last Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                // controller: emailController,
                prefixIcon: '',
                hintText: 'Phone Number',
                hintTextColor: Colors.white,
              ),
              const SizedBox(
                height: 15,
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
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined))),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: confirmPassController,
                hintText: 'Confirm Password',
                hintTextColor: Colors.white,
                prefixIcon: '',
                isPass: true,
                textInputType: TextInputType.visiblePassword,
                isObscure: isObscureConfirmPass,
                widget: (IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureConfirmPass = !isObscureConfirmPass;
                      });
                    },
                    icon: isObscureConfirmPass
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined))),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: register,
                text: "Sign Up",
                fontColorAlt: AppTheme.blackColor,
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
