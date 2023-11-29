import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_provider.g.dart';

/// カウント数を管理する
@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  /// カウントアップする
  void increment() {
    ++state;
  }

  /// カウントダウンする
  void decrement() {
    --state;
  }
}
