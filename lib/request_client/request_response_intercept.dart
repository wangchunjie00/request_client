
import 'package:dio/dio.dart';
import 'package:request_client/request_client.dart';

class ResponseInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (200 != response.statusCode || response.requestOptions.extra.containsKey("custom")) {
      handler.next(response);
      return;
    }
    ApiResponse apiResponse = ApiResponse.fromMapJson(response.data);
    apiResponse.message = response.data[RequestConfig.instance.messageKey];
    if (200 == response.statusCode && RequestConfig.instance.successCode == apiResponse.code) {
      response.data = apiResponse;
      handler.next(response);
    } else {
      if (RequestConfig.instance.enableLoginCodes.contains(apiResponse.code)) {
        if (RequestConfig.instance.loginOutCall != null){
          RequestConfig.instance.loginOutCall!();
        }
        Helper.showToast("Please login");
        handler.reject(DioException(
            requestOptions: response.requestOptions,
            message: "",
            type: DioExceptionType.badResponse),true);
      } else {
        handler.reject(DioException(
            requestOptions: response.requestOptions,
            message: apiResponse.message,
            type: DioExceptionType.badResponse),true);
      }
    }
  }
}
