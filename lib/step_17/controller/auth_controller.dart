import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// ユーザー情報を扱うコントローラ
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  /// コンストラクタ
  AuthController() {
    // ユーザー情報の変更を監視
    _auth.userChanges().listen((user) {
      log('changed user status');
      log('$user');

      state = user;
    });
  }

  final _auth = FirebaseAuth.instance;

  @override
  User? build() {
    log('called AuthController build');

    // ログインユーザーの情報を取得
    return _auth.currentUser;
  }

  /// メールアドレスとパスワードでログインする
  Future<SignInResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return SignInResult.ok;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return SignInResult.invalidEmail;
      } else if (e.code == 'user-disabled') {
        return SignInResult.userDisabled;
      } else if (e.code == 'user-not-found') {
        return SignInResult.invalidEmail;
      } else if (e.code == 'wrong-password') {
        return SignInResult.invalidEmail;
      }
      return SignInResult.unknownError;
    }
  }

  /// ログアウトする
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// 表示名を変更する
  Future<void> updateDisplayName(String displayName) async {
    await state!.updateDisplayName(displayName);
  }
}

/// ログイン結果
enum SignInResult {
  /// ログイン成功
  ok,

  /// メールアドレスが無効
  invalidEmail,

  /// ユーザーが無効
  userDisabled,

  /// 該当ユーザー無し
  userNotFound,

  /// パスワード誤り
  wrongPassword,

  /// 原因不明のエラー
  unknownError,
}

/// エラーメッセージ定義
extension SignInResultExt on SignInResult {
  /// エラーメッセージを返す
  String get errorMessage {
    switch (this) {
      case SignInResult.ok:
        return '';
      case SignInResult.invalidEmail:
        return 'メールアドレスが正しくありません';
      case SignInResult.userDisabled:
        return 'ユーザーが無効です';
      case SignInResult.userNotFound || SignInResult.wrongPassword:
        return 'ユーザーまたはパスワードが違います';
      case SignInResult.unknownError:
        return '原因不明のエラーです';
    }
  }
}
