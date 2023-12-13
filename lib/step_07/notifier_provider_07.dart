import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_provider_07.g.dart';

/// カウント数を管理する
@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  /// カウントアップする
  void increment() {
    ++state;
  }

  /// カウントダウンする
  void decrement() {
    --state;
  }
}

/// ユーザ情報
@immutable
class User {
  /// コントラクタ
  const User({required this.userName, required this.age});

  /// 名前
  final String userName;

  /// 年齢
  final int age;

  /// コピー
  User copyWith({String? userName, int? age}) {
    return User(userName: userName ?? this.userName, age: age ?? this.age);
  }
}

/// ユーザ情報を管理する
@riverpod
class UserInfo extends _$UserInfo {
  @override
  User build() {
    return const User(userName: '山田　太郎', age: 20);
  }

  /// 名前を変更
  void setUserName(String username) {
    state = state.copyWith(userName: username);
  }

  /// 年齢を変更
  void setAge(int age) {
    state = state.copyWith(age: age);
  }
}
