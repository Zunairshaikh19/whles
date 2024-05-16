import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_phone_field_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class VerifyProfileView extends StatelessWidget {
  const VerifyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: Image.asset(
                  Strings.verifyProfileImage,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 49),
              Text(
                'Set Up your account to\nbegin investing',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 24),
              Text(
                'Personal Profile',
                style: poppinsRegular.copyWith(fontSize: 17),
              ),
              Text(
                'Basic information to create your account',
                style: poppinsRegular.copyWith(
                    fontSize: 12, color: AppColors.greyProfile),
              ),
              const SizedBox(height: 10),
              Text(
                'Investment Profile',
                style: poppinsRegular.copyWith(fontSize: 17),
              ),
              Text(
                'Determining your investing goals',
                style: poppinsRegular.copyWith(
                    fontSize: 12, color: AppColors.greyProfile),
              ),
              const SizedBox(height: 10),
              Text(
                'Verify your identity',
                style: poppinsRegular.copyWith(fontSize: 17),
              ),
              Text(
                'Required by U.S financial regulatory laws',
                style: poppinsRegular.copyWith(
                    fontSize: 12, color: AppColors.greyProfile),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Set Up Account',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return VerifyPhoneFieldView();
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
