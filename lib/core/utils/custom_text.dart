import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.maxLines,
     this.fontFamily, this.color,
  });
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String? fontFamily;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: fontFamily ?? 'Montserrat',
        fontSize: size ?? 18,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
      ),
    );
  }
}
