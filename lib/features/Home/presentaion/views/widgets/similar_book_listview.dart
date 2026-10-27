import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/presentaion/manger/similler_book/similler_book_cubit.dart';
import 'package:bookly_app/features/Home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,

      child: BlocBuilder<SimillerBookCubit, SimillerBookState>(
        builder: (context, state) {
          if (state is SimillerBookSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child:  GestureDetector(
                    onTap: () => GoRouter.of(
                context,
              ).push(AppRouter.kBookDetails, extra: state.books[index]),
                    child: CustomBookImage(
                      imgeUrl:
                       state.books[index].imageUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt-3N3NP8JtlXy5l9SWd7hKfVdZ1vng_UKx9N84UXZF90bG4EkrDgSM3k&s=10',
                    ),
                  ),
                );
              },
            );
          } else if (state is SimillerBookFailur) {
            return CustomText(text: state.errMessage);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
