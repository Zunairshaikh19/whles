import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_otp_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhoneFieldView extends StatelessWidget {
  VerifyPhoneFieldView({super.key});
  final TextEditingController phoneNumber = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendOTP(BuildContext context) async {
    String phone = phoneNumber.text.trim();
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Navigate to home screen if you have one
        print('User signed in automatically');
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return VerifyOtpView(verificationId: verificationId);
            },
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(height: 35),
              Text('Please enter your phone',
                  style: poppinsMedium.copyWith(fontSize: 17)),
              const SizedBox(height: 35),
              CustomTextFormField(
                hintText: 'Phone number',
                controller: phoneNumber,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  _sendOTP(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
