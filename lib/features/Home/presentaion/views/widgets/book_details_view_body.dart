import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children:  [
          const CustomBookDetailsAppbar(),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: width * 0.17),
           child: const CustomBookImage(),
         ),
          const SizedBox(height: 20.0),
          
      ]),
    );
  }
}

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
