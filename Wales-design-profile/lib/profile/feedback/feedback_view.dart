import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We value your feedback!',
          style: poppinsMedium.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          'Give us feedback on what you liked about the app and what could be improved.',
          style: poppinsMedium.copyWith(fontSize: 10),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          hintText: 'Write here...',
          hintStyle: poppinsMedium.copyWith(color: AppColors.grey4),
          maxLines: 5,
        ),
        const SizedBox(height: 40),
        Center(
          child: PrimaryButton(
            title: 'SUBMIT',
            width: 200,
            textStyle: poppinsBold.copyWith(fontSize: 16, color: Colors.white),
            borderRadius: 60,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
