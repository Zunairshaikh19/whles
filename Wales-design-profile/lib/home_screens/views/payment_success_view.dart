import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    'Payment Successful',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ],
              ),
              const SizedBox(height: 100),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 48),
                    child: Column(
                      children: [
                        Text(
                          'Success',
                          style: poppinsMedium.copyWith(fontSize: 18, color: AppColors.greenColor),
                        ),
                        const SizedBox(height: 29),
                        Container(
                          width: 230,
                          height: 133,
                          decoration: BoxDecoration(
                            color: AppColors.mustardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 18),
                              Text(
                                '3 Shares buying',
                                style: poppinsMedium.copyWith(fontSize: 13, color: AppColors.purpleColor),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                '\$15.00',
                                style: poppinsMedium.copyWith(fontSize: 18, color: AppColors.purpleColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Your Buy Request for Received',
                          style: poppinsMedium.copyWith(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: AppColors.greenColor, width: 2),
                      ),
                      child: const Icon(Icons.check, color: AppColors.greenColor, size: 30),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
