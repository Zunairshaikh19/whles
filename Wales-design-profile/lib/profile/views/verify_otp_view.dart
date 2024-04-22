import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step1_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

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
              Text('Please enter your OTP', style: poppinsMedium.copyWith(fontSize: 17)),
              const SizedBox(height: 35),
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                fieldWidth: 45,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  // showDialog(
                  //     context: context,
                  //     builder: (context){
                  //       return AlertDialog(
                  //         title: Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     }
                  // );
                }, // end onSubmit
              ),
              const SizedBox(height: 60),
              Center(
                child: Text(
                  'Resend Code in 00:08',
                  style: poppinsMedium.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: 'Verify',
                onTap: () {
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
                                'Your Phone number has been Verifed',
                                style: poppinsRegular.copyWith(fontSize: 14),
                              ),
                              //const SizedBox(height: 20),
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
                },
              ),
              const SizedBox(height: 21),
              Center(
                child: Text(
                  'Resend Code',
                  style: poppinsBold.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
