// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      json['userName'] as String,
      email: json['email'] as String,
      age: json['age'] as int?,
      isDelete: json['isDelete'] as bool? ?? false,
      family: (json['family'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <User>[],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'age': instance.age,
      'isDelete': instance.isDelete,
      'family': instance.family,
    };
