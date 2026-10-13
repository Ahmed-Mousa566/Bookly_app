import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: SizedBox(
            height: 47.0,
            child: CustomButton(
              text: '19.99 €',
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
          child: SizedBox(
            height: 47.0,
            child: CustomButton(
              text: 'Free Preview',
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
