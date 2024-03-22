import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_17/common/function/common_function.dart';
import 'package:study_riverpod/step_17/common/widget/common_widget.dart';
import 'package:study_riverpod/step_17/controller/auth_controller.dart';
import 'package:study_riverpod/step_17/controller/update_request_controller.dart';
import 'package:study_riverpod/step_17/view/firestore_page.dart';
import 'package:study_riverpod/step_17/view/login_page.dart';

/// ホーム画面クラス
class HomePage extends ConsumerStatefulWidget {
  /// コンストラクタ
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var _displayName = '';

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ホーム画面'),
      ),
      body: ref.watch(updateRequestControllerProvider).when(
            data: (requestType) {
              // メインのWidgetの描画が終わってからダイアログを表示する
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showVersionUppDialog(context, requestType, ref);
              });
              return SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: Column(
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final user = ref.watch(authControllerProvider);

                              if (user?.displayName != null) {
                                return Text('${user?.displayName}さん');
                              } else {
                                return const Text('名無しの権兵衛さん');
                              }
                            },
                          ),
                          padding32(),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: '表示名を入力してください',
                            ),
                            onChanged: (value) {
                              _displayName = value;
                            },
                          ),
                          padding32(),
                          TextButton(
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
                              await authController
                                  .updateDisplayName(_displayName);
                            },
                            child: const Text(
                              '表示名変更',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          padding32(),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow.shade800,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              fixedSize: const Size(192, 32),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => const FirestorePage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Firestore',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          padding32(),
                          TextButton(
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
                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (context) => const LoginPage(),
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            error: (error, stack) => ErrorWidget(error),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
