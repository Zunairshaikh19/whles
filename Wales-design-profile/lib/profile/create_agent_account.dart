import 'package:app/profile/create_agent_profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CreateAgentAccount extends StatefulWidget {
  final String userType;
  const CreateAgentAccount(this.userType, {super.key});

  @override
  State<CreateAgentAccount> createState() => _CreateAgentAccountState();
}

class _CreateAgentAccountState extends State<CreateAgentAccount> {
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
  void register() async {
    bool check = checkCredentials();
    if (!check) {
      return;
    } else {
      navAccountProfile();
    }
    // setState(() {
    //   loading = true;
    // });
    // await FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //   email: emailController.text.trim(),
    //   password: passController.text,
    // )
    //     .then((value) {
    //   navAccountProfile();
    // }).catchError((onError) {
    //   setState(() {
    //     loading = false;
    //   });
    //   Constants.showMessage(context, onError.message.toString());
    // });
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

  void navAccountProfile() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
      return const CreateAgentProfile();
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
              CustomTextField(
                controller: emailController,
                prefixIcon: '',
                hintText: 'Email address',
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
                height: 15,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: register,
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
