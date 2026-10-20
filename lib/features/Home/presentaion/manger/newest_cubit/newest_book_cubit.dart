import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) =>
          emit(NewestBookFailur(errorMessege: failure.errMessage)),
      (books) => emit(NewestBookSuccess(books: books)),
    );
  }




}
