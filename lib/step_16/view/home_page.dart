import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_16/controller/home_page_controller.dart';

/// ホーム画面クラス
class MyHomePage extends ConsumerStatefulWidget {
  /// コンストラクタ
  const MyHomePage({required this.title, super.key});

  /// タイトル
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(homePageControllerProvider);

    final pageNotifier = ref.watch(homePageControllerProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          Center(
            child: ListTile(
              title: Text('Main Count ${pageState.mainCount}'),
              onTap: pageNotifier.increaseMainCount,
            ),
          ),
          Center(
            child: ListTile(
              title: Text('Sub Count ${pageState.subCount}'),
              onTap: pageNotifier.increaseSubCount,
            ),
          ),
          Center(
            child: Text('合計 ${pageState.totalCount}'),
          ),
        ],
      ),
    );
  }
}
