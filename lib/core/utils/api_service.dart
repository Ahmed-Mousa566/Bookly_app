import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
    Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    final options = Options(
      headers: token != null
          ? {'Authorization': 'Bearer $token'}
          : null,
    );

    final response = await dio.get(
      '$_baseUrl$endPoint',
      options: options,
    );

    return response.data;
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    final options = Options(
      headers: token != null
          ? {'Authorization': 'Bearer $token'}
          : null,
    );

    final response = await dio.post(
      url,
      data: body,
      options: options,
    );

    return response.data;
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    final options = Options(
      headers: token != null
          ? {'Authorization': 'Bearer $token'}
          : null,
    );

    final response = await dio.put(
      url,
      data: body,
      options: options,
    );

    return response.data;
  }
}