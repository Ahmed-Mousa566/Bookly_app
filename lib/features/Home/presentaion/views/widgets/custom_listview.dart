import 'package:bookly_app/features/Home/presentaion/views/widgets/Custom_Book_Image.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,

        child: ListView.builder(
          padding:  EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: const CustomBookImage(),
            );
          },
        ),
      ),
    );
  }
}
