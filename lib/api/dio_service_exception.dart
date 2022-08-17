import 'dart:developer';

import 'package:dio/dio.dart';

class DioServiceException implements Exception {
  final String message;
  final int code;
  final int errorCode;

  DioServiceException({
    required this.message,
    required this.code,
    required this.errorCode,
  });

  @override
  String toString() {
    return 'DioServiceException: code $code, errCode $errorCode, message: $message';
  }
}

Future<DioServiceException> handleDioError(DioError error) async {
  log('got http dio exception $error');

  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DioServiceException(
        code: 2000,
        message: 'Connect Timeout',
        errorCode: 200,
      );
    case DioErrorType.receiveTimeout:
      return DioServiceException(
        code: 3000,
        message: 'Receive Timeout',
        errorCode: 3000,
      );
    default:
      switch (error.response?.statusCode) {
        case 401:
          return DioServiceException(
            code: 401,
            message: "session expired",
            errorCode: 100,
          );
        case 500:
          return DioServiceException(
            code: 500,
            message: '500 Server Error',
            errorCode: 500,
          );
        case 502:
          return DioServiceException(
            code: 502,
            message: '502 Server Error',
            errorCode: 502,
          );
        case 503:
          return DioServiceException(
            code: 503,
            message: '503 Service Unavailable',
            errorCode: 503,
          );
        default:
          if (error.response == null) {
            return DioServiceException(
              code: 3000,
              message:
                  'Failed to connect to server. Please check your mobile connection.',
              errorCode: 3000,
            );
          } else {
            return DioServiceException(
              code: error.response?.statusCode ?? 500,
              message: error.response?.data['error'] ?? '',
              errorCode: 100,
            );
          }
      }
  }
}
