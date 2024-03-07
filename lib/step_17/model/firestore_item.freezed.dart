// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirestoreItem _$FirestoreItemFromJson(Map<String, dynamic> json) {
  return _FirestoreItem.fromJson(json);
}

/// @nodoc
mixin _$FirestoreItem {
  /// 名前
  String get name => throw _privateConstructorUsedError;

  /// メッセージ
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreItemCopyWith<FirestoreItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreItemCopyWith<$Res> {
  factory $FirestoreItemCopyWith(
          FirestoreItem value, $Res Function(FirestoreItem) then) =
      _$FirestoreItemCopyWithImpl<$Res, FirestoreItem>;
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class _$FirestoreItemCopyWithImpl<$Res, $Val extends FirestoreItem>
    implements $FirestoreItemCopyWith<$Res> {
  _$FirestoreItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirestoreItemImplCopyWith<$Res>
    implements $FirestoreItemCopyWith<$Res> {
  factory _$$FirestoreItemImplCopyWith(
          _$FirestoreItemImpl value, $Res Function(_$FirestoreItemImpl) then) =
      __$$FirestoreItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class __$$FirestoreItemImplCopyWithImpl<$Res>
    extends _$FirestoreItemCopyWithImpl<$Res, _$FirestoreItemImpl>
    implements _$$FirestoreItemImplCopyWith<$Res> {
  __$$FirestoreItemImplCopyWithImpl(
      _$FirestoreItemImpl _value, $Res Function(_$FirestoreItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_$FirestoreItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirestoreItemImpl implements _FirestoreItem {
  const _$FirestoreItemImpl({required this.name, required this.message});

  factory _$FirestoreItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirestoreItemImplFromJson(json);

  /// 名前
  @override
  final String name;

  /// メッセージ
  @override
  final String message;

  @override
  String toString() {
    return 'FirestoreItem(name: $name, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreItemImplCopyWith<_$FirestoreItemImpl> get copyWith =>
      __$$FirestoreItemImplCopyWithImpl<_$FirestoreItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirestoreItemImplToJson(
      this,
    );
  }
}

abstract class _FirestoreItem implements FirestoreItem {
  const factory _FirestoreItem(
      {required final String name,
      required final String message}) = _$FirestoreItemImpl;

  factory _FirestoreItem.fromJson(Map<String, dynamic> json) =
      _$FirestoreItemImpl.fromJson;

  @override

  /// 名前
  String get name;
  @override

  /// メッセージ
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$FirestoreItemImplCopyWith<_$FirestoreItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
