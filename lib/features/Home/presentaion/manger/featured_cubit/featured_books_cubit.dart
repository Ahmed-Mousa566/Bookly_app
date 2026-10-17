import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) =>
          emit(FeaturedBooksCubitFailur(errorMessege: failure.errMessage)),
      (books) => emit(FeaturedBooksCubitSuccess(books: books)),
    );
  }
}


