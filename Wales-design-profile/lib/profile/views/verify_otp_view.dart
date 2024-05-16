import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step1_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class VerifyOtpView extends StatefulWidget {
  final String verificationId;

  const VerifyOtpView({super.key, required this.verificationId});

  @override
  _VerifyOtpViewState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String otpCode = '';
  late Timer _timer;
  int _start = 60; // Countdown time in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _verifyOTP(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Phone Verification',
                    style: poppinsMedium.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your Phone number has been verified',
                    style: poppinsRegular.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title: 'Ok',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const VerifyFormStep1View();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: $e')),
      );
    }
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
              Text(
                'Please enter your OTP',
                style: poppinsMedium.copyWith(fontSize: 17),
              ),
              const SizedBox(height: 35),
              OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                fieldWidth: 45,
                onCodeChanged: (String code) {
                  // Handle validation or checks here if needed
                },
                onSubmit: (String verificationCode) {
                  otpCode = verificationCode;
                },
                autoFocus: true,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 60),
              Center(
                child: Text(
                  'Resend Code in 00:${_start.toString().padLeft(2, '0')}',
                  style: poppinsMedium.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: 'Verify',
                onTap: () {
                  _verifyOTP(context);
                },
              ),
              const SizedBox(height: 21),
              Center(
                child: GestureDetector(
                  onTap: _start == 0
                      ? () {
                          // Logic to resend the OTP
                          setState(() {
                            _start = 60;
                            startTimer();
                          });
                        }
                      : null,
                  child: Text(
                    'Resend Code',
                    style: poppinsBold.copyWith(
                      fontSize: 18,
                      color: _start == 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
