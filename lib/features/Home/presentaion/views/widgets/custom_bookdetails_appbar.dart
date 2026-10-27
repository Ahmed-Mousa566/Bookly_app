import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          IconButton(icon: Icon(Icons.close,
          color: Colors.white
          ), onPressed: () => GoRouter.of(
                context,
              ).pop(),
          ),

         IconButton(icon: Icon(Icons.shopping_cart_outlined,
         color: Colors.white
         ), onPressed: null),

        ],
      ),
    );
  }
}
