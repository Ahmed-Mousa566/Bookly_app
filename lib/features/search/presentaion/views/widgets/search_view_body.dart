import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/search/presentaion/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30.0),
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,  
        children: [
          SizedBox(height: 50),
          CustomTextField(),
          SizedBox(
            height: 16,
          ),
          CustomText(text: "Search Result"),
          SizedBox(
            height: 16,
          ),

          Expanded(child: SearchResult()),

          

        ],
      
      ),
    );
  }
}


class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: BestSellerItem(),
        );
      },
    );
  }
}
 
