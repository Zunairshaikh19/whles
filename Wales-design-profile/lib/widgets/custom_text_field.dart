import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  // FontWeight? fontWeight;
  final bool isPass, isObscure, isForgotPass, showIcon;
  final String? fieldName;
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final double height;
  final String hintText;
  final Widget? widget;
  final String prefixIcon;
  final int? maxlines;
  final Color? hintTextColor;
  final Icon? trailingIcon;
  final int? maxlength;
  const CustomTextField({
    super.key,
    this.textAlign = TextAlign.start,
    this.controller,
    // this.fontWeight,
    this.textInputType,
    this.fieldName,
    this.isPass = false,
    this.isObscure = false,
    this.isForgotPass = false,
    this.showIcon = false,
    this.height = 0.05,
    this.hintText = 'What is Happening?',
    this.widget,
    required this.prefixIcon,
    this.maxlines = 1,
    this.hintTextColor = AppTheme.kCustomTextFiledHintTextColor,
    this.trailingIcon,
    this.maxlength = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   fieldName.toString(),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        TextField(
            maxLength: 500,
            maxLines: maxlines,
            textAlign: textAlign,
            obscureText: isObscure,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: textInputType,
            controller: controller,
            style: TextStyle(
              color: hintTextColor == AppTheme.whiteColor
                  ? AppTheme.whiteColor
                  : AppTheme.blackColor,
              fontSize: 16,
              // fontWeight: fontWeight,
            ),
            cursorColor: AppTheme.blackColor,
            decoration: Constants.getInputDecoration(
                hintText, isPass, widget, prefixIcon, hintTextColor)),

        // SizedBox(
        //   height: MediaQuery.sizeOf(context).height * 0.015,
        // )
      ],
    );
  }
}
