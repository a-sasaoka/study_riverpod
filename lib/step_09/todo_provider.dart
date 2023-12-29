// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_09/todo.dart';

part 'todo_provider.g.dart';

@riverpod
Future<Todo> todo(TodoRef ref) async {
  final uri = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
  log(uri.toString());

  final response = await http.get(uri);
  log('Response status: ${response.statusCode}');
  log('Response body: ${response.body}');

  if (response.statusCode != HttpStatus.ok) {
    throw Exception('APIの呼び出しでエラーが発生しました。（ステータスコード : ${response.statusCode}）');
  }

  return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}
