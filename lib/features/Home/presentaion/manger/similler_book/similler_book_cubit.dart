import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'similler_book_state.dart';

class SimillerBookCubit extends Cubit<SimillerBookState> {
  SimillerBookCubit(this.homeRepo) : super(SimillerBookInitial());
   final HomeRepo homeRepo;
  Future<void> fetchSimillerBooks(BookModel book) async {
    emit(SimillerBookLoading());
    var result = await homeRepo.fetchSimillerBooks(book);
    result.fold(
      (failure) => emit(SimillerBookFailur(errMessage: failure.errMessage)),
      (books) => emit(SimillerBookSuccess(books: books)),
    );
  }
}
