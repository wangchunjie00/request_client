import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:request_client/request_client/request_error_intercept.dart';
import 'request_config.dart';
import 'request_response_intercept.dart';
import 'request_request_intercept.dart';
import 'package:request_client/request_client.dart';

enum RequestType { GET, POST, PUT, DELETE }

class RequestClient {
  late Dio _dio;
  static RequestClient? _instance;
  static RequestClient get instance => _instance!;

  RequestClient._internal(
      {required RequestConfig config, List<Interceptor>? interceptors}) {
    _dio = Dio(BaseOptions(
        baseUrl: config.baseUrl!,
        connectTimeout:  Duration(seconds: config.connectTimeOut),
        receiveTimeout:  Duration(seconds: config.readTimeOut)));
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true));
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(RequestIntercept());
    _dio.interceptors.add(ErrorIntercept());

    // 添加自定义拦截器（如果提供了）
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  static Future<void> init({
    required RequestConfig config,
    List<Interceptor>? interceptors,
  }) async {
    _instance ??=
        RequestClient._internal(interceptors: interceptors, config: config);
  }

  RequestClient({
   required RequestConfig config,
    List<Interceptor>? interceptors,
  }) : _dio = Dio(BaseOptions(
            baseUrl: config.baseUrl!,
            connectTimeout:  Duration(seconds: config.connectTimeOut),
            receiveTimeout:  Duration(seconds: config.readTimeOut))) {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true));
        _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(RequestIntercept());
    _dio.interceptors.add(ErrorIntercept());
    // 添加自定义拦截器
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Future<ApiResponse> request<T>(
    String url, {
    RequestType? method,
    data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool showLoading = false,
  }) async {
    try {
      Options options = Options(
        method: method?.name ?? RequestType.GET.name,
        extra: extra,
        headers: headers,
      );

      if (showLoading) {
        Helper.showLoading();
      }
      Response response = await _dio.request(url,
          queryParameters: data, data: data, options: options);
      if (showLoading) {
        Helper.hideLoading();
      }
      //
      return response.data;
    } on DioException catch (e) {
      if (showLoading) {
        Helper.hideLoading();
      }
      // Helper.showToast(RequestError.handleError(e));
      throw e.toString();
    }
  }
}
