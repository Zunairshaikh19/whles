import 'package:app/profile/create_account.dart';
import 'package:app/profile/reset_password.dart';
import 'package:app/profile/user_type.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_rich_text.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool isObscurePass = true;

  bool isButtonEnabled = false;
  void goToResetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const ResetPassword();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4A635F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios,
          color: AppTheme.whiteColor,
          size: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              prefixIcon: '',
              hintText: 'Email Address',
              hintTextColor: Colors.white,
            ),
            const SizedBox(
              height: 75,
            ),
            CustomButton(
              isButtonEnable: isButtonEnabled,
              height: 56,
              onPress: goToResetPassword,
              text: "Reset Password",
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
                            const CreateAccount('User') //SignUpView(),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
