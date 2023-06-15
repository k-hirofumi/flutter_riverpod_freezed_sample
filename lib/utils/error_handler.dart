import 'package:dio/dio.dart';

class ErrorHandler {
  //エラーステータスを返す
  static void handle(error) {
    if (error is DioException) {
      if (error.response != null) {
        // エラーステータスが存在する場合
        final statusCode = error.response!.statusCode;
        // エラーレスポンスの内容も取得可能
        final errorData = error.response!.data;
        throw statusCode!;
      } else {
        // ネットワーク接続エラーやタイムアウトなどの場合
        throw 900;
      }
    } else {
      // DioError以外の例外の場合
      throw 901;
    }
  }
}
