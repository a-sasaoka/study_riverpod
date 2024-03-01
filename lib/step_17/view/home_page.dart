import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_17/controller/auth_controller.dart';
import 'package:study_riverpod/step_17/view/login_page.dart';

/// ホーム画面クラス
class HomePage extends ConsumerStatefulWidget {
  /// コンストラクタ
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ホーム画面'),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.yellow.shade800,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            fixedSize: const Size(192, 32),
          ),
          onPressed: () async {
            await authController.logout();
            if (context.mounted) {
              unawaited(
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const LoginPage(),
                  ),
                ),
              );
            }
          },
          child: const Text(
            'ログアウト',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
