import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_provider_03.g.dart';

/// カウント数を管理する
@riverpod
class AsyncCounter extends _$AsyncCounter {
  int _counter = 0;

  @override
  FutureOr<int> build() async {
    // 3秒待つ
    await Future.delayed(const Duration(seconds: 3), () {});
    return _counter;
  }

  /// カウントアップする
  Future<void> increment() async {
    // stateをローディングに変更
    state = const AsyncValue.loading();
    // 変更した状態をstateに設定
    state = await AsyncValue.guard(() async {
      // 1秒待つ
      await Future.delayed(const Duration(seconds: 1), () {});
      return ++_counter;
    });
  }

  /// カウントダウンする
  Future<void> decrement() async {
    // stateをローディングに変更
    state = const AsyncValue.loading();
    // 変更した状態をstateに設定
    state = await AsyncValue.guard(() async {
      // 1秒待つ
      await Future.delayed(const Duration(seconds: 1), () {});
      return --_counter;
    });
  }
}
