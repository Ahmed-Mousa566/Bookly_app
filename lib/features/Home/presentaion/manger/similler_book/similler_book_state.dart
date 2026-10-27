part of 'similler_book_cubit.dart';

@immutable
sealed class SimillerBookState {}

final class SimillerBookInitial extends SimillerBookState {}

final class SimillerBookLoading extends SimillerBookState {}

final class SimillerBookSuccess extends SimillerBookState {
  final List<BookModel> books;

  SimillerBookSuccess({required this.books});
}

final class SimillerBookFailur extends SimillerBookState {
  final String errMessage;

  SimillerBookFailur({required this.errMessage});
}
