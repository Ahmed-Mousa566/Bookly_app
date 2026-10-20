import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/presentaion/manger/featured_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/Custom_Book_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,

      child: BlocBuilder<FeaturedBooksCubit, FeaturedBookState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child:  CustomBookImage(imgeUrl: state.books[index].coverUrl??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt-3N3NP8JtlXy5l9SWd7hKfVdZ1vng_UKx9N84UXZF90bG4EkrDgSM3k&s=10' ),
                );
              },
            );
          } else if (state is FeaturedBooksFailur) {
            return CustomText(text: state.errorMessege);
          } else if (state is FeaturedBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } 
          else
{            return Container();
}        },
      ),
    );
  }
}
