import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step2_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class VerifyFormStep1View extends StatelessWidget {
  const VerifyFormStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    var currentRouteName = route?.settings.name;
    developer.log('Current Route: $currentRouteName');
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
              const SizedBox(height: 25),
              const FormProgressIndicator(step: 1),
              const SizedBox(height: 47),
              Text(
                'Please enter your Legal\nName',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(hintText: 'First Name'),
              const SizedBox(height: 20),
              const CustomTextFormField(hintText: 'Second Name'),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const VerifyFormStep2View();
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
