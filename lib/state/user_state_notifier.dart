// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:test_flavor/entity/user_entity.dart';

// class UserStateNotifier extends StateNotifier<AsyncValue<UserEntity>> {
//   UserStateNotifier() : super(const AsyncValue.loading());

//   void setEmail(String email) {
//     // state = state.copyWith(email: email);
//     state = AsyncValue.data(state.value!.copyWith(email: email));
//   }

//   void increment() {
//     // state = state.copyWith(id: state.id + 1);
//     state = state.value != null
//         ? AsyncValue.data(state.value!.copyWith(id: state.value!.id + 1))
//         : state;
//   }

//   // //画像ファイルを保存
//   // saveNowImg(File imageFile) async {
//   //   final photoDomain = PhotoDomain();
//   //   await photoDomain.saveNowImageAndPath(imageFile);
//   // }
// }

// final userStateNotifierProvider =
//     StateNotifierProvider<UserStateNotifier, AsyncValue<UserEntity>>((ref) {
//   return UserStateNotifier();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/entity/user_entity.dart';

class UserStateNotifier extends StateNotifier<AsyncValue<UserEntity>> {
  UserStateNotifier({required UserEntity initialData})
      : super(AsyncValue.data(initialData));
  // //プロバイダー呼び出し時に初期データ取得
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  void setUser({int? id, String? name, String? email}) {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(
        id: id ?? data.id,
        name: name ?? data.name,
        email: email ?? data.email,
      ));
    });
  }

  void setEmail(String email) {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(
        email: email,
      ));
    });
  }

  void increment() {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(
        id: data.id + 1,
      ));
    });
  }

  Future<void> fetchDataAndUpdateUser() async {
    state = const AsyncValue.loading();

    try {
      // final data = await fetchData();
      await Future.delayed(const Duration(seconds: 2));
      state = AsyncValue.data(UserEntity(id: 99, name: 'fetchde_name'));
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // Future<UserEntity> fetchData() async {
  //   // 非同期にデータを取得する処理を実装してください
  //   // この例では、ダミーデータを返しています
  //   await Future.delayed(const Duration(seconds: 1));
  //   return UserEntity(id: 'John Doe', age: 25);
  // }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, AsyncValue<UserEntity>>((ref) {
  return UserStateNotifier(
      initialData: UserEntity(id: 0, name: 'test_name', email: 'test_email'));
});
