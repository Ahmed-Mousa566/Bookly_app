import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.size,
    this.fontWeight,
     this.onPressed,
  });
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final double? size;
  final FontWeight? fontWeight;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,

      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: CustomText(
        text: text,
        color: textColor,
        size: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
