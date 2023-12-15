// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart`と書く
part 'user.freezed.dart';

// `{ファイル名}.g.dart`と書く
part 'user.g.dart';

// with _$クラス名を付ける
@freezed
class User with _$User {
  // factoryメソッドが必要
  // 最後に「=_クラス名」を書く
  const factory User(
    /// 名前（必須項目）
    String userName, {
    /// メールアドレス（必須項目）
    required String email,

    /// 年齢（任意項目）
    int? age,

    /// 削除フラグ（デフォルト値:false）
    @Default(false) bool isDelete,

    /// 家族
    @Default(<User>[]) List<User> family,
  }) = _User;

  // fromJson用のfactoryコンストラクタが必要
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // メソッドやカスタムゲッター、カスタムフィールドを追加する場合はプライベートコンストラクタが必要
  const User._();

  // メソッドの追加
  String greetWithName() {
    return 'Hello, My name is $userName';
  }

  // カスタムゲッター（有効な家族のリストを取得）
  List<User> get activeFamily =>
      family.where((element) => !element.isDelete).toList();
}
