import 'package:dio/dio.dart';
import 'package:request_client/request_client.dart';

class ErrorIntercept extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse) {
      Helper.showToast(err.message);
    } else {
      var message = RequestError.handleError(err);
      Helper.showToast(message);
    }
  }
}
