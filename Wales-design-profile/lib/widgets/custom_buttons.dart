import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Color bgColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color borderColor;
  final Function()? onTap;
  final Widget? child;
  final double width;
  final double height;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    this.title,
    this.textStyle,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.bgColor,
    this.disabledColor = AppColors.lightGrey,
    this.disabledTextColor = AppColors.primaryColor,
    this.borderColor = Colors.transparent,
    required this.onTap,
    this.child,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      color: bgColor,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor),
      ),
      onPressed: onTap,
      child: child ??
          Text(
            title ?? '',
            style: textStyle ?? barlowMedium.copyWith(color: textColor, fontSize: 16),
          ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Color textColor;
  final Function()? onTap;
  final double width;
  final double borderRadius;
  final Color disabledColor;
  final Color disabledTextColor;

  const SecondaryButton({
    super.key,
    required this.child,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.bgColor,
    this.onTap,
    this.width = double.infinity,
    this.borderRadius = 8,
    this.disabledColor = AppColors.lightGrey,
    this.disabledTextColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: width,
      color: bgColor,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}

class UnderlineTextButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color? color;

  const UnderlineTextButton({
    super.key,
    this.onTap,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: robotoCondensedRegular.copyWith(
          fontSize: 14,
          decoration: TextDecoration.underline,
          decorationColor: color ?? Colors.white,
          color: color,
        ),
      ),
    );
  }
}
