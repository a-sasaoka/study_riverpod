// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providerの定数をグローバルに宣言
final testProvider = StateProvider((ref) => 0);
final stringProvider = StateProvider((ref) => '初期値');

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
    final cnt = ref.watch(testProvider);
    final text = ref.watch(stringProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('$cnt'),
            Text(text),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow.shade800,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              onPressed: () {
                ref.watch(testProvider.notifier).update((state) => state + 1);
                ref.watch(stringProvider.notifier).update((state) => '更新1');
              },
              child: const Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ProviderScope(
              overrides: [
                testProvider.overrideWith((ref) => 100),
              ],
              child: const Page1(),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cnt = ref.watch(testProvider);
    final text = ref.watch(stringProvider);

    return Column(
      children: [
        Text('$cnt'),
        Text(text),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.yellow.shade800,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
          onPressed: () {
            ref.watch(testProvider.notifier).update((state) => state + 1);
            ref.watch(stringProvider.notifier).update((state) => '更新2');
          },
          child: const Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
