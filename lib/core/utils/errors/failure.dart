import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  final int? statusCode;

  const Failure(this.errMessage, {this.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage, {super.statusCode});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (e.message?.contains('SocketException') ?? false) {
          return const ServerFailure('No Internet Connection');
        }
        return const ServerFailure('Unexpected Error, Please try again!');
        default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 422:
        return ServerFailure(
          _extractMessage(response) ?? 'Invalid request, Please try again',
          statusCode: statusCode,
        );
      case 404:
        return ServerFailure(
          'Your request not found, Please try later!',
          statusCode: statusCode,
        );
      case 429:
        return ServerFailure(
          'Too many requests, Please try later',
          statusCode: statusCode,
        );
      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerFailure(
            'Internal Server error, Please try later',
            statusCode: statusCode,
          );
        }
        return ServerFailure(
          'Oops There was an Error, Please try again',
          statusCode: statusCode,
        );
    }
  }

  /// الجزء الوحيد اللي بتغيره من مشروع لمشروع حسب شكل الـ API response
  static String? _extractMessage(dynamic data) {
    if (data is Map) {
      final error = data['error'];
      if (error is Map && error['message'] is String) {
        return error['message'] as String;
      }
      if (data['message'] is String) return data['message'] as String;
    }
    return null;
  }
}