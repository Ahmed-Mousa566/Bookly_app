part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBooksInitial extends FeaturedBookState {}

final class FeaturedBooksLoading extends FeaturedBookState {}

final class FeaturedBooksSuccess extends FeaturedBookState {
  final List<BookModel> books;

  FeaturedBooksSuccess({required this.books});
}

final class FeaturedBooksFailur extends FeaturedBookState {
  final String errorMessege;

  FeaturedBooksFailur({required this.errorMessege});
}
