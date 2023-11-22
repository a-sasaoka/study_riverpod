// @riverpod アノテーションを使うために`riverpod_annotation`をインポート
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成を実行するために、`part '{ファイル名}.g.dart';`を書く
part 'test_provider.g.dart';

/// 引数無しの一番シンプルなケース
@riverpod
String title(TitleRef ref) {
  return 'タイトル';
}

/// 引数ありのケース
@riverpod
String label(
  // メソッド名+Refの引数型が必要
  LabelRef ref, {
  required String str1, // 任意の引数も定義可能
  int num = 1, // デフォルト値も使用可能
}) {
  return str1 + num.toString();
}

/// 非同期処理のケース
@riverpod
Future<String> name(NameRef ref) async {
  // 1秒待つ
  await Future.delayed(const Duration(seconds: 1), () {});
  return 'やまだたろう';
}

/// Streamのケース
@riverpod
Stream<String> count(CountRef ref) async* {
  for (var i = 1; i <= 10; i++) {
    // 5秒待つ
    await Future.delayed(const Duration(seconds: 5), () {});
    yield i.toString();
  }
}
