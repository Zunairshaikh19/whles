import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_pending_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class VerifyFormStep4View extends StatelessWidget {
  const VerifyFormStep4View({super.key});

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
              const FormProgressIndicator(step: 4),
              const SizedBox(height: 47),
              Text(
                'Upload ID Images',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 27),
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined, size: 35, color: AppColors.secondaryColor),
                      const SizedBox(height: 10),
                      Text(
                        'Upload front page',
                        style: poppinsRegular.copyWith(fontSize: 13, color: AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined, size: 35, color: AppColors.secondaryColor),
                      const SizedBox(height: 10),
                      Text(
                        'Upload back page',
                        style: poppinsRegular.copyWith(fontSize: 13, color: AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    'Government-issued',
                    style: poppinsRegular.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    'Original full-size, unedited document',
                    style: poppinsRegular.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Place documents against a single-coloured background',
                      style: poppinsRegular.copyWith(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    'Readable, well-lit, coloured images',
                    style: poppinsRegular.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.close, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    'No black and white images',
                    style: poppinsRegular.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.close, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    'No edited or expired documents',
                    style: poppinsRegular.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const VerifyFormPendingView();
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
