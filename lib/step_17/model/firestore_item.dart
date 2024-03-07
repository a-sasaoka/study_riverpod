import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_item.freezed.dart';
part 'firestore_item.g.dart';

/// Firestoreのデータクラス
@freezed
class FirestoreItem with _$FirestoreItem {
  /// factoryコンストラクタ
  const factory FirestoreItem({
    /// 名前
    required String name,

    /// メッセージ
    required String message,
  }) = _FirestoreItem;

  /// JSONから作成
  factory FirestoreItem.fromJson(Map<String, dynamic> json) =>
      _$FirestoreItemFromJson(json);
}
