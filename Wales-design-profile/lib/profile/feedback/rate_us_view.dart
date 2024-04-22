import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class RateUsView extends StatefulWidget {
  const RateUsView({super.key});

  @override
  State<RateUsView> createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  List<bool> isSelected = [false, false, false, false, false];

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
          'Rate LandaLite out of 5 stars',
          style: poppinsMedium.copyWith(fontSize: 10),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = List.generate(5, (i) => i <= index);
                  });
                },
                child: Icon(
                  Icons.star,
                  color: isSelected[index] ? Colors.yellow : Colors.yellow.withOpacity(0.3),
                  size: 40,
                ),
              ),
            ),
          ],
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
