import 'package:app/app_theme.dart';
import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_otp_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class VerifyPhoneFieldView extends StatefulWidget {
  VerifyPhoneFieldView({super.key});

  @override
  _VerifyPhoneFieldViewState createState() => _VerifyPhoneFieldViewState();
}

class _VerifyPhoneFieldViewState extends State<VerifyPhoneFieldView> {
  final TextEditingController phoneNumber = TextEditingController();
  String countryCode = '+92';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void _sendOTP(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    String phone = '$countryCode${phoneNumber.text.trim()}';
    print('Phone: $phone');

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });

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

        setState(() {
          _isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

   Widget phoneNumberF() {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 20,right: 10,bottom: 10,left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.whiteColor,),
      ),
      child: IntlPhoneField(
        controller: phoneNumber,
        dropdownTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
        dropdownIcon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        initialCountryCode: countryCode,
        onChanged: (phone) {
        },
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Stack(
            children: [
              Column(
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
                  phoneNumberF(),
                  const Spacer(),
                  PrimaryButton(
                    title: 'Next',
                    onTap: () {
                      _sendOTP(context);
                    },
                  ),
                ],
              ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
