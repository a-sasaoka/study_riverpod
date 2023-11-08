// ignore_for_file: public_member_api_docs

// @riverpod アノテーションを使うために `riverpod_annotation` をインポート
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成を実行するために、 `part '{ファイル名}.g.dart';` を書く
part 'test_provider.g.dart';

@riverpod
String label(
  // メソッド名+Refの引数型が必要
  LabelRef ref, {
  required String str1, // 任意の引数も定義可能
  int num = 1, // デフォルト値も使用可能
}) {
  return str1 + num.toString();
}
