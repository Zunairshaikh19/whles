import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_otp_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class VerifyPhoneFieldView extends StatelessWidget {
  const VerifyPhoneFieldView({super.key});

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
              Text('Please enter your phone', style: poppinsMedium.copyWith(fontSize: 17)),
              const SizedBox(height: 35),
              const CustomTextFormField(
                hintText: 'Phone number',
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const VerifyOtpView();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
