import 'package:flutter/material.dart';

class CustomFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  final bool showIcon;
  final String prefixIcon;
  final double height;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  const CustomFieldSearch({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isPass,
    required this.showIcon,
    required this.prefixIcon,
    required this.height,
    required this.textInputType,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: showIcon ? Image.asset(prefixIcon) : null,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
