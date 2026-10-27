import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://gutendex.com/',
      //    connectTimeout: const Duration(seconds: 30),
      // receiveTimeout: const Duration(seconds: 30),
      // sendTimeout: const Duration(seconds: 30),
    ),
  );
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final options = Options(
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );

    try {
      print('GET REQUEST STARTED');
      print('⏳ BEFORE DIO GET');
      final response = await dio.get(
        endPoint,
        queryParameters: {...?queryParameters},
        options: options,
      );

      print('✅ AFTER DIO GET');
      print('📡 STATUS: ${response.statusCode}');
      print('📦 DATA: ${response.data}');

      print('REQUEST URL: ${response.requestOptions.uri}');
      print('STATUS CODE: ${response.statusCode}');
      print('PARAMETERS: $queryParameters');

      return response.data;
    } on DioException catch (e) {
      print('DIO ERROR TYPE: ${e.type}');
      print('DIO ERROR MESSAGE: ${e.message}');
      print('REQUEST URL: ${e.requestOptions.uri}');
      print('PARAMETERS: $queryParameters');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE BODY: ${e.response?.data}');

      rethrow;
    } catch (e) {
      print('API SERVICE ERROR: $e');
      rethrow;
    }
  }
}
