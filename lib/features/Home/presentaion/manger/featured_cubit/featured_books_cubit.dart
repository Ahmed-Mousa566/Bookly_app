import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBookState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaturedBooksFailur(errMessege: failure.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
