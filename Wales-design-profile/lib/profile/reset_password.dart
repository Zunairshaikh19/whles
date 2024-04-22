import 'package:app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool isObscurePass = true;

  bool isButtonEnabled = false;
  bool isObscureConfirmPass = true;
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
                          color: AppTheme.kCustomTextOrColor,
                        ))),
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
              height: 45,
            ),
            CustomButton(
              isButtonEnable: isButtonEnabled,
              height: 56,
              onPress: () {},
              text: "Reset Password",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
