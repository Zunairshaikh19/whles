import 'package:app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text, fontFamily;
  final double height, width;
  final double fontSize;
  final String? image;
  final bool? showImage;
  final Color fontColor;
  final Color fontColorAlt; // New font color parameter white colour
  final FontWeight? fontWeight;
  final VoidCallback? onPress;
  final double radius;
  final Color? containerColor;
  final Color? containerColorgreen;
  final bool isButtonEnable;

  const CustomButton({
    super.key,
    this.text,
    this.fontFamily,
    this.height = 40,
    this.width = double.infinity,
    this.fontSize = 16,
    this.image,
    this.showImage,
    this.fontColor = Colors.black,
    this.fontColorAlt = Colors.white, // Initialize with white font color
    // this.shadowColor,
    this.fontWeight,
    this.onPress,
    this.radius = 6,
    this.containerColor = AppTheme.kCustomButtonColor,
    this.containerColorgreen = AppTheme.kCustomButtonColorgreen,
    this.isButtonEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onPress,
        child: Material(
          color: containerColor,
          borderOnForeground: true,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          type: MaterialType.canvas,
          child: Container(
            padding: showImage == true
                ? const EdgeInsets.symmetric(horizontal: 14)
                : const EdgeInsets.symmetric(horizontal: 0),
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                border: showImage == true
                    ? Border.all(color: AppTheme.kCustomBorderColor)
                    : Border.all(
                        width: 0,
                      )),
            child: Row(
              mainAxisAlignment: showImage == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (showImage == true) Image(image: ExactAssetImage(image!)),
                Text(
                  text.toString(),
                  style: TextStyle(
                    color: isButtonEnable ? fontColor : fontColorAlt,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
