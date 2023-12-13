// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_07/notifier_provider_07.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                // provider
                final counter = ref.watch(counterProvider);

                return Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                // カウンターの値が10以外の値を行き来している時はWidgetは再構築されない
                // つまり初期表示、10になった時、10から9または11になった時だけ再構築される
                final isTen =
                    ref.watch(counterProvider.select((value) => value == 10));
                log('$isTen');
                return isTen
                    ? const Text(
                        '10になったよ！',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )
                    : const Text(
                        '10の時だけ変わる',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    // notifier
                    final notifier = ref.watch(counterProvider.notifier);

                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow.shade800,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      onPressed: notifier.increment,
                      child: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    // notifier
                    final notifier = ref.watch(counterProvider.notifier);

                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow.shade800,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      onPressed: notifier.decrement,
                      child: const Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                // 名前
                final userName = ref
                    .watch(userInfoProvider.select((value) => value.userName));

                log('名前が変わった！');
                return Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                // notifier
                final notifier = ref.watch(userInfoProvider.notifier);

                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow.shade800,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  onPressed: () => notifier.setUserName('鈴木　イチロー'),
                  child: const Text(
                    '名前を変える',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                // 年齢
                final age =
                    ref.watch(userInfoProvider.select((value) => value.age));

                log('年齢が変わった！');
                return Text(
                  '$age',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                // notifier
                final notifier = ref.watch(userInfoProvider.notifier);

                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow.shade800,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  onPressed: () => notifier.setAge(30),
                  child: const Text(
                    '年齢を変える',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
