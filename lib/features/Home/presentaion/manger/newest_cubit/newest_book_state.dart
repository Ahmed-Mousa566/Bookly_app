part of 'newest_book_cubit.dart';

@immutable
sealed class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<BookModel> books;

  NewestBookSuccess({required this.books});
}

final class NewestBookFailur extends NewestBookState {
  final String errMessege;

  NewestBookFailur({required this.errMessege});
}
