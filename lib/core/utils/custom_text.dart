import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text,  this.size, this.fontWeight});
  final String text;
  final double? size;
   final FontWeight? fontWeight; 
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 118,
        fontWeight: fontWeight?? FontWeight.w600,
      ),
    );
  }
}