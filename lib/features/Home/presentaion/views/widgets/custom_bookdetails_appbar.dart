import 'package:flutter/material.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconButton(icon: Icon(Icons.close,
          color: Colors.white
          ), onPressed: null),

         IconButton(icon: Icon(Icons.shopping_cart_outlined,
         color: Colors.white
         ), onPressed: null),

        ],
      ),
    );
  }
}
