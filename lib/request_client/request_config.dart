import 'package:dio/dio.dart';

typedef InterceptorBack = Function();

typedef InterceptorRequestBack = Function(RequestOptions options);

class RequestConfig {
  String? baseUrl;
  int connectTimeOut = 10; //请求超时
  int writeTimeOut = 10;
  int readTimeOut = 10;
  int successCode = 200; //成功状态码
  String dataKey = "data"; //数据key
  String codeKey = "code"; //状态码key
  String messageKey = "msg"; //消息key
  List enableLoginCodes = []; //登陆实效的code集合
  InterceptorRequestBack? requestCall; //请求拦截配置 设置token
  InterceptorBack? loginOutCall; //token失效拦截器回调
  static RequestConfig? _instance;
  static RequestConfig get instance => _instance!;
  RequestConfig._internal({required String this.baseUrl});
  static Future<void> init({
    required String baseUrl,
  }) async {
    _instance ??= RequestConfig._internal(baseUrl: baseUrl);
  }

  RequestConfig({
    String baseUrl = 'your_default_base_url',
  }) {
    _instance ??= RequestConfig._internal(baseUrl: baseUrl);
  }
}
