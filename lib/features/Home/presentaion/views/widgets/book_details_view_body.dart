import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/books_action.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_bookdetails_appbar.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/similar_book_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetailsAppbar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.21),
                  child:  CustomBookImage(
                    imgeUrl:
                        bookModel.imageUrl?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt-3N3NP8JtlXy5l9SWd7hKfVdZ1vng_UKx9N84UXZF90bG4EkrDgSM3k&s=10', 
                  ),
                ),
                const SizedBox(height: 20.0),
                 CustomText(
                  text: bookModel.title,
                  size: 30.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GTSectraFine',
                ),
                const SizedBox(height: 6.0),

                 CustomText(
                  text: bookModel.authorName,
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
                    CustomText(
                      text: '4.8',
                      size: 18.0,
                      fontWeight: FontWeight.w600,
                    ),

                    SizedBox(width: 6),

                    CustomText(
                      text: '(250)',
                      size: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),

                const SizedBox(height: 37),

                 BookAction(bookModel: bookModel,),

                const Expanded(child: SizedBox(height: 50)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const CustomText(
                    text: 'You can also like',
                    size: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                const SimilarBooksListview(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
