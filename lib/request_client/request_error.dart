import 'package:dio/dio.dart';
class RequestError {
  static String handleError(DioException error) {
    String message = "unknown";
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = "connectionTimeout";
        break;
      case DioExceptionType.receiveTimeout:
        message = "receiveTimeout";
        break;
      case DioExceptionType.sendTimeout:
        message = "sendTimeout";
        break;
      case DioExceptionType.badResponse:
        message = error.message ?? message;
        break;
      case DioExceptionType.cancel:
        message = "cancel";
        break;
      case DioExceptionType.connectionError:
        message = "connectionError";
        break;
      case DioExceptionType.badCertificate:
        message = "badCertificate";
        break;
      case DioExceptionType.unknown:
        message = "unknown";
    }
    return message;
  }
}