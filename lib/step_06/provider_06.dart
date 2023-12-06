import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_06.g.dart';

/// 現在時刻を返す
@riverpod
Future<String> time(TimeRef ref) async {
  await Future.delayed(const Duration(seconds: 1), () {});
  return DateFormat('HH:mm:ss').format(DateTime.now());
}
