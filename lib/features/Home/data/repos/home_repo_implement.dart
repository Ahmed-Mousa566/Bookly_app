import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/errors/failure.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'books/',
        queryParameters: {'sort': 'popular', 'languages': 'en', 'page': 1},
      );

      final List<BookModel> books = [];

      for (var item in data['results'] ?? []) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on DioException catch (e) {
      print('FEATURED BOOKS ERROR: ${e.response?.data ?? e.message}');

      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print('FEATURED BOOKS ERROR: $e');

      return left(ServerFailure('Unexpected Error, Please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'books/',
        queryParameters: {'sort': 'descending', 'languages': 'en', 'page': 1},
      );

      final List<BookModel> books = [];

      for (var item in data['results'] ?? []) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on DioException catch (e) {
      print('FEATURED BOOKS ERROR: ${e.response?.data ?? e.message}');

      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print('FEATURED BOOKS ERROR: $e');

      return left(ServerFailure('Unexpected Error, Please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimillerBooks(
    BookModel book,
  ) async {
    try {
      String topic = 'adventure';

      if (book.subjects.isNotEmpty) {
        topic = book.subjects.first.split(RegExp(r'--|,|;')).first.trim();
      }

      final data = await apiService.get(
        endPoint: 'books/',
        queryParameters: {'topic': topic, 'languages': 'en', 'page': 1},
      );

      final List<BookModel> books = [];

       for (var item in data['results'] ?? []) {
      final similarBook = BookModel.fromJson(
        Map<String, dynamic>.from(item),
      );

      if (similarBook.id != book.id) {
        books.add(similarBook);
      }
    }

      return right(books);
    } on DioException catch (e) {
  print('STATUS CODE: ${e.response?.statusCode}');
  print('REQUEST URL: ${e.requestOptions.uri}');
  print('RESPONSE DATA: ${e.response?.data}');
  print('ERROR MESSAGE: ${e.message}');

      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print('FEATURED BOOKS ERROR: $e');

      return left(ServerFailure(e.toString()));
    }
  }
}
