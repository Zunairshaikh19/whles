import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final VoidCallback onTap;
  final String leftText, rightText;
  final Color leftTextColor;
  final double leftFontSize;
  final FontWeight? leftFontWeight;
  final Color rightTextColor;
  final double rightFontSize;
  const CustomRichText({
    super.key,
    required this.onTap,
    required this.leftText,
    required this.rightText,
    required this.leftTextColor,
    required this.leftFontSize,
    this.leftFontWeight,
    required this.rightTextColor,
    required this.rightFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: leftText.toString(),
            style: TextStyle(
                fontSize: leftFontSize ?? 16,
                fontWeight: leftFontWeight ?? FontWeight.w500,
                color: leftTextColor,
                fontFamily: 'Poppins'),
          ),
          TextSpan(
              text: ' ${rightText.toString()}',
              style: TextStyle(
                  fontSize: rightFontSize ?? 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: rightTextColor),
              recognizer: TapGestureRecognizer()..onTap = onTap),
        ],
      ),
    );
  }
}
