// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_01/test_provider_01.dart';

void main() {
  // Providerをアプリで使用するためにProviderScopeで囲む
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      titleProvider,
    );

    final label = ref.watch(
      labelProvider(
        str1: 'テスト',
      ),
    );

    final name = ref.watch(
      nameProvider,
    );

    final count = ref.watch(
      countProvider,
    );

    // FutureやStreamのProviderはwhenを使うこと状態に応じた処理が可能
    return name.when(
      loading: CircularProgressIndicator.adaptive,
      error: (err, stack) => Center(child: Text('error: $err')),
      data: (name) {
        return count.when(
          loading: CircularProgressIndicator.adaptive,
          error: (err, stack) => Center(child: Text('error: $err')),
          // 複数の状態を待ちたい場合はwhenをネストするしか無い？
          data: (count) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Scaffold(
                appBar: AppBar(title: Text(title)),
                body: Center(
                  child: Column(
                    children: [
                      Text(label),
                      Text(name),
                      Text(count),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
