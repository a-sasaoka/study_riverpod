import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_14/provider.dart';

part 'theme_selector_provider.g.dart';

/// テーマ保存用のキー
const _themePrefsKey = 'selectedThemeKey';

/// 選択されたテーマを管理するProvider
@Riverpod(keepAlive: true)
class ThemeSelector extends _$ThemeSelector {
  @override
  ThemeMode build() {
    // 記憶しているテーマがあれば反映
    final pref = ref.watch(sharedPreferencesProvider);
    final themeIndex = pref.getInt(_themePrefsKey);
    if (themeIndex == null) {
      return ThemeMode.system;
    }

    final themeMode = ThemeMode.values.firstWhere(
      // ThemeModeのListからthemeIndexに一致するものを探して設定
      (element) => element.index == themeIndex,
      // 見つからなかったら初期値（ThemeMode.system）を設定
      orElse: () => ThemeMode.system,
    );
    return themeMode;
  }

  /// テーマの変更と保存を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    await ref
        .read(sharedPreferencesProvider)
        .setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
