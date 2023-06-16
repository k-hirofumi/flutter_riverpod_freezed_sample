import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio _dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio();
    // Dioインスタンスの初期設定
    _dio.options.baseUrl = "https://test.com/api/";
    _dio.options.connectTimeout = const Duration(seconds: 5); //5s
    _dio.options.receiveTimeout = const Duration(seconds: 3); //3s

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // リクエストごとに動的なヘッダーなどを追加
        // options.headers["Authorization"] = "Bearer " + yourToken;
        if (kDebugMode) {
          print("REQUEST[${options.method}] => PATH: ${options.path}");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print(
              "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} /  DATA: ${response.data}");
          print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
        }
        return handler.next(response);
      },
      onError: (error, handler) {
        //FIX_ME ここにクラッシュ通知を実装するとAPIエラーのみ拾える。バリデーションエラーは拾えない
        if (kDebugMode) {
          print(
              'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path} /  DATA: ${error.response?.data}');
        }
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;

  void changeBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  void changeHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }
}
