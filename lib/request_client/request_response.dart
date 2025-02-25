import 'dart:convert';

typedef ApiResponseDataConvert<T> = T? Function(Map<String, dynamic> map);

class ApiResponse<T> {
  int? code;
  String? message;
  T? data;
  ApiResponse({this.code, this.data, this.message});
  bool get isSuccess => code == 0 || code == 200;
  factory ApiResponse.fromMapJson(Map<String, dynamic> json,
      {ApiResponseDataConvert<T>? convert}) {
    var data = json['data'];
    var code = json['code'];
    if (data != null && convert != null) {
      final result = ApiResponse(
          code: code, data: convert(Map<String, dynamic>.from(data)));
      return result;
    }
    return ApiResponse(
      code: code,
      data: data,
      message: json['message'],
    );
  }

  @override
  String toString() {
    var map = {"code": code, "message": message, "data": data};
    return jsonEncode(map);
  }
}
