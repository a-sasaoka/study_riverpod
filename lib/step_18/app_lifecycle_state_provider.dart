import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state_provider.g.dart';

/// アプリのライフサイクルを監視するProvider
@Riverpod(keepAlive: true)
AppLifecycleState appLifecycleState(AppLifecycleStateRef ref) {
  /// _AppLifecycleObserverをインスタンス化する際にコールバック関数として状態を変更する処理を渡す
  final observer = _AppLifecycleObserver((value) => ref.state = value);

  // Observerを登録
  final binding = WidgetsBinding.instance..addObserver(observer);

  // Providerが破棄される際にObserverも解除
  ref.onDispose(() => binding.removeObserver(observer));

  return AppLifecycleState.resumed;
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this._didChangeState);

  // 外部から処理を追加出来るようにコンストラクタでコールバック関数を渡せるようにしている
  // ValueChanged<T> は void Function(T value) の別名
  // typedef ValueChanged<T> = void Function(T value) と定義されている
  // 何らかの型のvalueを引数に持ち何も返さない関数型という意味
  final ValueChanged<AppLifecycleState> _didChangeState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // ライフサイクルが変わった時にコールバック関数を呼び出す
    _didChangeState(state);
    super.didChangeAppLifecycleState(state);
  }
}

/// 再開したかどうかを返すextension
extension AppLifecycleStateExtension on AppLifecycleState {
  /// 再開したか否かを返す
  bool get isResumed => this == AppLifecycleState.resumed;
}
