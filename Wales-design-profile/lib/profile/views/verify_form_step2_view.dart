import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step3_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class VerifyFormStep2View extends StatelessWidget {
  const VerifyFormStep2View({super.key});

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
              const SizedBox(height: 25),
              const FormProgressIndicator(step: 2),
              const SizedBox(height: 47),
              Text(
                'Please enter your\nResidential Address',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(hintText: 'Street Address'),
              const SizedBox(height: 20),
              const CustomTextFormField(hintText: 'City'),
              const SizedBox(height: 20),
              const CustomTextFormField(hintText: 'Postal/Zip'),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const VerifyFormStep3View();
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
