part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksCubitState {}

final class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitSuccess extends FeaturedBooksCubitState {
  final List<BookModel> books;

  FeaturedBooksCubitSuccess({required this.books});
}

final class FeaturedBooksCubitFailur extends FeaturedBooksCubitState {
  final String errorMessege;

  FeaturedBooksCubitFailur({required this.errorMessege});
}
