// ignore_for_file: public_member_api_docs

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/firebase_options.dart';
import 'package:study_riverpod/step_17/controller/auth_controller.dart';
import 'package:study_riverpod/step_17/controller/update_request_controller.dart';
import 'package:study_riverpod/step_17/view/home_page.dart';
import 'package:study_riverpod/step_17/view/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    final user = ref.read(authControllerProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ref.watch(updateRequestControllerProvider).when(
            data: (requestType) {
              if (requestType == UpdateRequestType.not) {
                if (user != null) {
                  return const HomePage();
                } else {
                  return const LoginPage();
                }
              } else {
                return _ContentAndDialog(
                  requestType: requestType,
                  user: user,
                );
              }
            },
            error: (error, stack) => ErrorWidget(error),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}

class _ContentAndDialog extends StatelessWidget {
  const _ContentAndDialog({required this.requestType, this.user});

  final UpdateRequestType requestType;
  final User? user;

  @override
  Widget build(BuildContext context) {
    // ビルド後にダイアログを表示させるための記法
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (requestType != UpdateRequestType.not) {
        // 新しいアプリバージョンがある場合はダイアログを表示する
        showDialog<void>(
          context: context,
          // ダイアログの外をタップしても閉じられないようにする
          barrierDismissible: false,
          builder: (context) {
            return PopScope(
              // AndroidのBackボタンで閉じられないようにする
              canPop: false,
              child: AlertDialog(
                title: const Text('最新の更新があります。\nアップデートをお願いします。'),
                actions: [
                  if (requestType == UpdateRequestType.cancelable)
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('キャンセル'),
                    ),
                  TextButton(
                    onPressed: () {
                      // 本来であればここにStoreに飛ばす処理を書く
                      Navigator.of(context).pop();
                    },
                    child: const Text('アップデート'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
    return user != null ? const HomePage() : const LoginPage();
  }
}
