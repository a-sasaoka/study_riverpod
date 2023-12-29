// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_11/todo.dart';

part 'todo_provider.g.dart';

// デフォルトではAutoDispose
@riverpod
Future<Todo11> todo1(Todo1Ref ref) async {
  log('todo1');

  ref.onDispose(() {
    log('todo1 onDispose');
  });

  final uri = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
  final response = await http.get(uri);

  if (response.statusCode != HttpStatus.ok) {
    throw Exception('APIの呼び出しでエラーが発生しました。（ステータスコード : ${response.statusCode}）');
  }

  return Todo11.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

// keepAliveにtrueを指定するとAutoDisposeにならない
@Riverpod(keepAlive: true)
Future<Todo11> todo2(Todo2Ref ref) async {
  log('todo2');

  ref.onDispose(() {
    log('todo2 onDispose');
  });

  final uri = Uri.https('jsonplaceholder.typicode.com', 'todos/2');
  final response = await http.get(uri);

  if (response.statusCode != HttpStatus.ok) {
    throw Exception('APIの呼び出しでエラーが発生しました。（ステータスコード : ${response.statusCode}）');
  }

  return Todo11.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}
