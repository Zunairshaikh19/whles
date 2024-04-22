import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final IconData? suffixIcon;
  final Icon? prefixIcon;
  final Function? onPrefixIconPressed;
  final Function? onSuffixIconPressed;
  final bool isPassword;
  final bool readOnly;
  final Color? fillColor;
  final int maxLines;
  final bool showErrorMessage;
  final String suffixText;
  final Function()? onTap;
  final TextInputType keyBoardType;
  final Function(String?)? validator;
  final double verticalMargin;
  final double horizontalMargin;
  final Color? outlineColor;
  final Color? focusBorderColor;
  final Color? enableBorderColor;
  final TextAlign textAlign;
  final double radius;
  final bool isSuffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool isEnable;

  const CustomTextFormField(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.isEnable = true,
      this.isSuffixIcon = false,
      this.hintStyle,
      this.inputTextStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.focusBorderColor,
      this.enableBorderColor,
      this.onSuffixIconPressed,
      this.onPrefixIconPressed,
      this.outlineColor,
      this.textAlign = TextAlign.start,
      this.isPassword = false,
      this.readOnly = false,
      this.showErrorMessage = true,
      this.horizontalMargin = 0,
      this.verticalMargin = 0,
      this.suffixText = '',
      this.validator,
      this.onTap,
      this.maxLines = 1,
      this.radius = 5,
      this.keyBoardType = TextInputType.text,
      this.inputFormatters = const [],
      this.textInputAction = TextInputAction.next,
      this.fillColor,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      child: TextFormField(
        initialValue: initialValue,
        enabled: isEnable,
        keyboardType: keyBoardType,
        obscuringCharacter: '●',
        validator: (value) => validator?.call(value),
        scrollPhysics: const BouncingScrollPhysics(),
        style: inputTextStyle ?? poppinsRegular,
        obscureText: isPassword,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        textAlign: textAlign,
        controller: controller,
        decoration: InputDecoration(
          //hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: outlineColor ?? AppColors.borderColor),
          ),
          label: Text(
            hintText ?? '',
            style: hintStyle ?? robotoCondensedRegular.copyWith(color: AppColors.primaryColor, fontSize: 15),
          ),
          errorStyle: !showErrorMessage ? const TextStyle(height: 0) : null,
          hintStyle: hintStyle ?? robotoCondensedRegular.copyWith(color: AppColors.darkGrey, fontSize: 15),
          suffixText: suffixText,
          suffixIcon: isSuffixIcon
              ? IconButton(
                  onPressed: () {
                    if (onSuffixIconPressed != null) onSuffixIconPressed!();
                  },
                  icon: Icon(suffixIcon, size: 20),
                )
              : null,
          prefixIcon: prefixIcon,
          filled: true,
          isDense: true,
          fillColor: fillColor ?? Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius), borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius), borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: outlineColor ?? AppColors.borderColor)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: focusBorderColor ?? AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
