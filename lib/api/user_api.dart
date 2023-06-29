import 'dart:async';

import 'package:test_flavor/entity/response/get_user_response/get_user_response.dart';
import 'package:test_flavor/utils/dio_client.dart';
import 'package:test_flavor/utils/error_handler.dart';

class UserApi {
  static Future<GetUserResponse> getUserInfo() async {
    return await DioClient().dio.get('https://api.example.com/data').then(
      (value) {
        //取得データの返還
        final validated = GetUserResponse.fromJson(value.data);
        return validated;
      },
    ).onError(ErrorHandler.handler);
  }

  static Future<dynamic> updateUser() async {
    return await DioClient()
        .dio
        .put('https://api.example.com/data')
        .then((value) {
      return value;
    }).onError(ErrorHandler.handler);
  }
}
