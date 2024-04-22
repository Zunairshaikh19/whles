import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/profile/feedback/feedback_view.dart';
import 'package:app/profile/feedback/rate_us_view.dart';
import 'package:flutter/material.dart';

class MainFeedbackView extends StatefulWidget {
  const MainFeedbackView({super.key});

  @override
  State<MainFeedbackView> createState() => _MainFeedbackViewState();
}

class _MainFeedbackViewState extends State<MainFeedbackView> {
  bool isFeedback = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Feedback',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFeedback = true;
                      });
                    },
                    child: Text(
                      'Feedback',
                      style: poppinsMedium.copyWith(
                        fontSize: 20,
                        color: isFeedback ? AppColors.primaryColor : AppColors.greyLight,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFeedback = false;
                      });
                    },
                    child: Text(
                      'Rate Us',
                      style: poppinsMedium.copyWith(
                        fontSize: 20,
                        color: isFeedback ? AppColors.greyLight : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 3.5,
                      color: isFeedback ? AppColors.primaryColor : AppColors.grey3,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 3.5,
                      color: isFeedback ? AppColors.grey3 : AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              isFeedback ? const FeedbackView() : const RateUsView(),
            ],
          ),
        ),
      ),
    );
  }
}
