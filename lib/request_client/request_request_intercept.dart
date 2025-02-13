import 'package:dio/dio.dart';
import 'request_config.dart';
class RequestIntercept extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    if (RequestConfig.instance.requestCall != null){
      RequestConfig.instance.requestCall!(options);
    }
    handler.next(options);
  }
}