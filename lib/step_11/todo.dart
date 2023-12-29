// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

part 'todo.g.dart';

@freezed
class Todo11 with _$Todo11 {
  const factory Todo11({
    required int userId,
    required int id,
    required String title,
    @Default(false) bool completed,
  }) = _Todo11;

  factory Todo11.fromJson(Map<String, dynamic> json) => _$Todo11FromJson(json);
}
