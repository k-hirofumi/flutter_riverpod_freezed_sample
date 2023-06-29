import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/entity/state/user_info_state/user_info_state.dart';

class UserInfoStateNotifier extends StateNotifier<UserInfoState> {
  UserInfoStateNotifier()
      : super(UserInfoState(id: 0, name: 'test_name', email: 'test_email'));

  void setUser({int? id, String? name, String? email}) {
    state = state.copyWith(
      id: id ?? state.id,
      name: name ?? state.name,
      email: email ?? state.email,
    );
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void increment() {
    state = state.copyWith(id: state.id + 1);
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserInfoStateNotifier, UserInfoState>((ref) {
  return UserInfoStateNotifier();
});
