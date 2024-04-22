import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FormProgressIndicator extends StatelessWidget {
  final int step;

  const FormProgressIndicator({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          4,
          (index) => Expanded(
            child: Container(
              height: 3,
              margin: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: step == index + 1 ? AppColors.primaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
