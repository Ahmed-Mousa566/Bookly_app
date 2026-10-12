import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: AssetImage(AssetsData.testImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomText(
                  text: 'Harry Potter and the Goblet of Fire ',
                  size: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GTSectraFine',
                ),
              ),
      
              const SizedBox(height: 3),
      
              CustomText(
                text: 'J.K. Rowling',
                size: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
      
              const SizedBox(height: 3),
      
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,

                child: Row(
                  children: const [
                     CustomText(
                      text: '19.99 €',
                      size: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                    ),
                     Spacer(flex: 1),
                     Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.0,
                    ),

                 SizedBox(width: 6.3),
                CustomText(
                text: '4.8',
                size: 18.0,
                fontWeight: FontWeight.w600,),

                 SizedBox(width: 5),

               CustomText(
                text: '(2390)',
                size: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
