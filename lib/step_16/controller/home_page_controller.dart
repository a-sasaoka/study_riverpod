import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_14/provider.dart';
import 'package:study_riverpod/step_16/model/home_page_state.dart';

part 'home_page_controller.g.dart';

/// メインカウント保存用のキー
const _mainCountPrefsKey = 'mainCountKey';

/// サブカウント保存用のキー
const _subCountPrefsKey = 'subCountKey';

/// ホーム画面のコントローラ
@riverpod
class HomePageController extends _$HomePageController {
  @override
  HomePageState build() {
    // 記憶している値があれば反映
    final pref = ref.watch(sharedPreferencesProvider);
    final main = pref.getInt(_mainCountPrefsKey) ?? 0;
    final sub = pref.getInt(_subCountPrefsKey) ?? 0;

    return HomePageState(
      mainCount: main,
      subCount: sub,
    );
  }

  /// メインカウントを+1する
  Future<void> increaseMainCount() async {
    // SharedPreferencesに保存
    await ref
        .read(sharedPreferencesProvider)
        .setInt(_mainCountPrefsKey, state.mainCount + 1);

    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  /// サブカウントを+1する
  Future<void> increaseSubCount() async {
    // SharedPreferencesに保存
    await ref
        .read(sharedPreferencesProvider)
        .setInt(_subCountPrefsKey, state.subCount + 1);

    state = state.copyWith(subCount: state.subCount + 1);
  }

  /// すべてのカウントを0にリセットする
  Future<void> resetAllCount() async {
    // SharedPreferencesに保存
    await ref.read(sharedPreferencesProvider).setInt(_mainCountPrefsKey, 0);
    await ref.read(sharedPreferencesProvider).setInt(_subCountPrefsKey, 0);

    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}
