import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/api/user_api.dart';
import 'package:test_flavor/entity/state/item_info_state_response.dart';
import 'package:test_flavor/entity/state/post_list_state_response.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class GetPostListStateNotifier
    extends StateNotifier<AsyncValue<List<PostListStateResponse>>> {
  GetPostListStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    print('refetchPost');
    fetchPostList();
  }
  final Ref ref;

  Future<void> fetchPostList() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));

      //データ取得
      // final data = await UserApi.getUserInfo();

      // //ステートの更新
      // ref
      //     .read(userStateNotifierProvider.notifier) //リビルドに巻き込まれないように必ずreadを使用する
      //     .setUser(id: data.id, name: data.name, email: data.email);
      List<PostListStateResponse> data = [
        PostListStateResponse(id: 123, userId: 111, post: 'test投稿です'),
        PostListStateResponse(id: 123, userId: 222, post: 'test2投稿です'),
      ];

      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refetchPostList() async {
    try {
      // await Future.delayed(const Duration(seconds: 1));

      //データ取得
      final data = await UserApi.getUserInfo();

      // //ステートの更新
      // ref
      //     .read(userStateNotifierProvider.notifier) //リビルドに巻き込まれないように必ずreadを使用する
      //     .setUser(id: data.id, name: data.name, email: data.email);
      List<PostListStateResponse> dummyData = [
        PostListStateResponse(id: 123, userId: 111, post: 'test投稿です'),
        PostListStateResponse(id: 123, userId: 222, post: 'test2投稿です'),
      ];
      final list = state.value ?? [];
      list.addAll(dummyData);

      state = AsyncValue.data(list);
    } catch (error, stackTrace) {
      // state = AsyncValue.error(error, stackTrace);
      throw error;
    }
  }

  // void addPost({required int id, required int userId, required String post}) {
  //   state.whenData((data) {
  //     data.addAll([PostListStateResponse(id: id, userId: userId, post: post)]);
  //     state = AsyncValue.data(data);
  //   });
  // }
}

final getPostListStateNotifierProvider = StateNotifierProvider.autoDispose<
    GetPostListStateNotifier, AsyncValue<List<PostListStateResponse>>>((ref) {
  return GetPostListStateNotifier(ref);
});
