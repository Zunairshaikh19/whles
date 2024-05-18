import 'package:app/admin/dashboard.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

import '../../home_screens/home.dart';

class VerifyFormPendingView extends StatelessWidget {
  const VerifyFormPendingView({Key? key}) : super(key: key);

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
                  // Navigate back to the profile screen
                  Navigator.popUntil(context, ModalRoute.withName('/profile'));
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(height: 30),
              Text(
                'Please Wait, We connect\nwith you Soon',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 56),
              Center(
                  child: Image.asset(Strings.pendingClock,
                      height: 107, width: 107)),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Pending',
                  style: poppinsMedium.copyWith(fontSize: 23),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Back',
                onTap: () {
                  // Navigate back to the profile screen
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (_) {
                      return const Home();
                    },
                  ), (route) => false);

                  //Navigator.popUntil(context, ModalRoute.withName('/profile'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
