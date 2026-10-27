import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: const SizedBox(
            height: 47.0,
            child:  CustomButton(
              text: 'Free - Book',
              size: 18.0,
              fontWeight: FontWeight.w900,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
          ),
        ),
        Expanded(
          child:  SizedBox(
            height: 47.0,
            child: CustomButton(
              onPressed: () => GoRouter.of(
                context,
              ).push(AppRouter.kBookReaderView, extra: bookModel),
              text: 'Read Now',
              size: 18.0,
              fontWeight: FontWeight.w800,
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
