import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgeUrl,});
  final String imgeUrl;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
     
      child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1/ 1.5,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:imgeUrl,
                    errorWidget: (context, url, error) => Icon(Icons.book_rounded),
                  ),
               
          ),
        
      ),
    );
  }
}
