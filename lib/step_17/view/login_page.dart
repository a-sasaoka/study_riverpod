import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_17/common/function/common_function.dart';
import 'package:study_riverpod/step_17/common/widget/common_widget.dart';
import 'package:study_riverpod/step_17/controller/auth_controller.dart';
import 'package:study_riverpod/step_17/controller/update_request_controller.dart';
import 'package:study_riverpod/step_17/view/home_page.dart';

/// ログイン画面クラス
class LoginPage extends ConsumerStatefulWidget {
  /// コンストラクタ
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // パスワード表示（false）/非表示（true）
  var _isObscure = true;

  var _email = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ログイン画面'),
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
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'メールアドレスを入力してください',
                              hintText: 'mail@example.com',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              _email = value;
                            },
                          ),
                          padding32(),
                          TextField(
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              labelText: 'パスワードを入力してください',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              _password = value;
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
                              final ret = await authController
                                  .signInWithEmailAndPassword(
                                email: _email,
                                password: _password,
                              );
                              // ログインに成功したらホーム画面に遷移
                              if (ret == SignInResult.ok) {
                                if (context.mounted) {
                                  await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'ログイン',
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
