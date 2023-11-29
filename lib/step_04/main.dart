// ignore: lines_longer_than_80_chars
// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_04/notifier_provider.dart';

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
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends ConsumerWidget {
  const MyHomePage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('Called MyHomePage1 build');

    // provider
    final counter = ref.watch(counterProvider);

    // notifier
    final notifier = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MyHomePage1'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
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
                ),
                TextButton(
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
                ),
              ],
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage2(),
                  ),
                );
              },
              child: const Text(
                '次へ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage2 extends ConsumerStatefulWidget {
  const MyHomePage2({super.key});

  @override
  ConsumerState<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends ConsumerState<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    log('Called MyHomePage2 build');

    // provider
    final counter = ref.watch(counterProvider);

    // notifier
    final notifier = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MyHomePage2'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
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
                ),
                TextButton(
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
                ),
              ],
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage3(),
                  ),
                );
              },
              child: const Text(
                '次へ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage3 extends StatelessWidget {
  const MyHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    log('Called MyHomePage3 build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MyHomePage3'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                // provider
                final counter = ref.watch(counterProvider);

                log('Called Consumer1 build');

                return Text(
                  counter.toString(),
                  style: const TextStyle(
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

                    log('Called Consumer2 build');

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

                    log('Called Consumer3 build');

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage4(),
                  ),
                );
              },
              child: const Text(
                '次へ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage4 extends ConsumerWidget {
  const MyHomePage4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('Called MyHomePage4 build');

    // provider
    final counter = ref.watch(counterProvider);

    // notifier
    final notifier = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MyHomePage4'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
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
                ),
                TextButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
