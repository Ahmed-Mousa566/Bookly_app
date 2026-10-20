import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgeUrl});
  final String imgeUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image:  DecorationImage(
            image: NetworkImage(imgeUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
