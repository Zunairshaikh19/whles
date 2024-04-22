import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Notifications',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 10),
                    Text(
                      'View top viewed Properties of this week',
                      style: poppinsRegular.copyWith(fontSize: 12),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 10),
                    Text(
                      'View top viewed Properties of this week',
                      style: poppinsRegular.copyWith(fontSize: 12),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 18),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
