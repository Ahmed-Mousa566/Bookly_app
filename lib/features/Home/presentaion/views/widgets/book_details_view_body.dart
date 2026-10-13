import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/books_action.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_bookdetails_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppbar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.21),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 20.0),
          const CustomText(
            text: 'The Jungle Book',
            size: 30.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'GTSectraFine',
          ),
          const SizedBox(height: 6.0),

          const CustomText(
            text: 'Rudyard Kipling',
            size: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'GTSectraFine',
            color: Colors.white60,
            fontStyle: FontStyle.italic,
          ),
          const SizedBox(height: 18.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 20.0),

              SizedBox(width: 2),
              CustomText(text: '4.8', size: 18.0, fontWeight: FontWeight.w600),

              SizedBox(width: 6),

              CustomText(
                text: '(2390)',
                size: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),

          SizedBox(height: 37),

          const BookAction(),
        ],
      ),
    );
  }
}

