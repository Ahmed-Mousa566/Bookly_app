import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,

      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: const CustomBookImage(imgeUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt-3N3NP8JtlXy5l9SWd7hKfVdZ1vng_UKx9N84UXZF90bG4EkrDgSM3k&s=10',),
          );
        },
      ),
    );
    
  }
}
