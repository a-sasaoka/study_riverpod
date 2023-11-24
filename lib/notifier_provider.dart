import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_provider.g.dart';

/// カウント数を管理する
@riverpod
class Counter extends _$Counter {
  int _counter = 0;

  @override
  int build() {
    return _counter;
  }

  /// カウントアップする
  void increment() {
    _counter++;
    // 変更した状態をstateに設定
    state = _counter;
  }

  /// カウントダウンする
  void decrement() {
    _counter--;
    // 変更した状態をstateに設定
    state = _counter;
  }
}
