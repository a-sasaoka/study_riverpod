// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_riverpod/step_14/provider.dart';
import 'package:study_riverpod/step_15/theme_selector_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme と darkTheme で使用するライトテーマとダークテーマを指定できる
      // 標準のテーマをcopyWith で必要な部分だけカスタマイズするのが簡単
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // 使用するテーマを指定する
      // Provider を watch することでテーマを動的に切り替える
      themeMode: ref.watch(themeSelectorProvider),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // ListView.builder を使用して、定義されているテーマを一覧表示する
      body: ListView.builder(
        // 縦方向だけマージンを設定
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: ThemeMode.values.length,
        itemBuilder: (_, index) {
          final themeMode = ThemeMode.values[index];
          return RadioListTile(
            value: themeMode,
            // このラジオボタンのグループに対して選択されている値
            // この値を同じ value のラジオボタンが選択状態で表示される
            groupValue: currentThemeMode,
            // 変更された内容で Provider を更新して、テーマを動的に切り替えている
            onChanged: (newTheme) => themeSelector.changeAndSave(newTheme!),
            title: Text(themeMode.name),
          );
        },
      ),
    );
  }
}

/// enum を拡張してカスタマイズした名称を取得できるようにする
extension ThemeModeExt on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return 'システム設定と同じ';
      case ThemeMode.light:
        return 'ライトモード';
      case ThemeMode.dark:
        return 'ダークモード';
    }
  }
}
