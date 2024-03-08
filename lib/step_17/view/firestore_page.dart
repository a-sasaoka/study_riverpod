import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_17/controller/firestore_controller.dart';

/// FirestorをStreamで取得して表示する画面
class FirestorePage extends ConsumerStatefulWidget {
  /// コンストラクタ
  const FirestorePage({super.key});

  @override
  ConsumerState<FirestorePage> createState() => _FirebasePageState();
}

class _FirebasePageState extends ConsumerState<FirestorePage> {
  @override
  Widget build(BuildContext context) {
    final firestore = ref.watch(firestoreControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stream'),
      ),
      body: firestore.when(
        data: (items) {
          log('items=$items');
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text('${item.name}さん'),
                        ),
                        Text(item.message),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
        error: (error, stack) {
          log('error=$error');
          log('stack=$stack');
          return Text('Error: $error');
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
