import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

/// ホーム画面の状態を表すクラス
@freezed
class HomePageState with _$HomePageState {
  /// factoryコンストラクタ
  const factory HomePageState({
    /// メインのカウンタ
    @Default(0) int mainCount,

    /// サブのカウンタ
    @Default(0) int subCount,
  }) = _HomePageState;

  const HomePageState._();

  /// カウント数の合計
  int get totalCount => mainCount + subCount;
}
