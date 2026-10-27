import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/presentaion/manger/newest_cubit/newest_book_cubit.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return ListView.builder(
            //  physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: BestSellerItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBookLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NewestBookFailur) {
          return CustomText(text: state.errMessege);
        } else {
          return Container();
        }
      },
    );
  }
}
