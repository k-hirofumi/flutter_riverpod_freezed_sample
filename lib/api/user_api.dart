import 'package:test_flavor/entity/response/get_user_response.dart';
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
    ).onError(
      (error, stackTrace) {
        //FIX_ME ここにクラッシュ通知を実装すればAPIエラーとバリデーションエラーを拾える
        ErrorHandler.handle(error); //エラーハンドリング
        throw '';
      },
    );
    // final test = new GetUserResponse(
    //   id: 1,
    //   name: 'getted',
    // );
    // return GetUserResponse.fromJson({});
  }

  static Future<dynamic> updateUser() async {
    return await DioClient()
        .dio
        .put('https://api.example.com/data')
        .then((value) {
      return value;
    }).onError((error, stackTrace) {
      ErrorHandler.handle(error); //エラーハンドリング
      throw '';
    });
  }
}
