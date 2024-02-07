// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* 
SharedPreferences のインスタンス取得は以下のように非同期で行う

final prefs = await SharedPreferences.getInstance();

これをそのまま Provider でキャッシュしようとすると

final sharedPreferencesProvider =
    FutureProvider((_) => SharedPreferences.getInstance());

のように Provider も非同期になってしまう

そこで以下のように初回のみ非同期でインスタンスを取得するように一工夫する
*/

// 初期状態では例外を投げる
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          // ProviderScope の overrides 内で初期化して使えるようにする
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
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
  late int _cnt;

  @override
  void initState() {
    super.initState();

    final prefs = ref.read(sharedPreferencesProvider);
    _cnt = prefs.getInt('cnt') ?? 0;
    prefs.setInt('cnt', _cnt + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('起動回数：$_cnt'),
      ),
    );
  }
}
