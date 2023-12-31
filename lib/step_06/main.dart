// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_06/provider_06.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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
  Future<void> _timeProvider() async {
    // 強制的にProviderを更新
    ref.invalidate(timeProvider);
  }

  @override
  Widget build(BuildContext context) {
    final time = ref.watch(
      timeProvider,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: time.when(
        loading: () => const CircularProgressIndicator.adaptive(),
        error: (error, stackTrace) => Text('Error: $error, $stackTrace'),
        data: (data) {
          return RefreshIndicator(
            onRefresh: _timeProvider,
            child: ListView(
              children: [
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
