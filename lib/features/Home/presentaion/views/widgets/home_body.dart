import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/best_seller_listview.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/cuastom_appbar.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_listview.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
     return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child :  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(
              right: 24.0,
              top: 40.0,
              bottom: 20.0,
            ),
            child: CustomAppBar(),
          ),
          CustomListView(),
          SizedBox(height: 50.0),
          CustomText(
            text: 'Best Seller',
            size: 24.0,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12.0),
         
        ],
      ),
    ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],

     );


  }
}

