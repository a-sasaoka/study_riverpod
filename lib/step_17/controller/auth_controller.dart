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
      state = user;
    });
  }

  final _auth = FirebaseAuth.instance;

  @override
  User? build() {
    // ログインユーザーの情報を取得
    return _auth.currentUser;
  }
}
