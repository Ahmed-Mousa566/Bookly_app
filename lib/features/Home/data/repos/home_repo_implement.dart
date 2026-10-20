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
        endPoint: 'volumes',
        queryParameters: {
          'q': 'Programming',
        //  'filter': 'free-ebooks',

        },
      );

      final List<BookModel> books = [];

      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on DioException catch (e) {
      print('FEATURED BOOKS ERROR: ${e.response?.data ?? e.message}');

      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print('FEATURED BOOKS ERROR: $e');

      return left(
        ServerFailure('Unexpected Error, Please try again!'),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
      try {
      final data = await apiService.get(
        endPoint: 'volumes',
        queryParameters: {
          'q': 'Programming',
          // 'filter': 'free-ebooks',
          'orderBy':'newest'
        },
      );

      final List<BookModel> books = [];

      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on DioException catch (e) {
      print('FEATURED BOOKS ERROR: ${e.response?.data ?? e.message}');

      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print('FEATURED BOOKS ERROR: $e');

      return left(
        ServerFailure('Unexpected Error, Please try again!'),
      );
    }
  }
}


