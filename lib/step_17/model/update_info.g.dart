// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateInfoImpl _$$UpdateInfoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateInfoImpl(
      requiredVersion: json['requiredVersion'] as String,
      enabledAt: DateTime.parse(json['enabledAt'] as String),
      canCancel: json['canCancel'] as bool? ?? false,
    );

Map<String, dynamic> _$$UpdateInfoImplToJson(_$UpdateInfoImpl instance) =>
    <String, dynamic>{
      'requiredVersion': instance.requiredVersion,
      'enabledAt': instance.enabledAt.toIso8601String(),
      'canCancel': instance.canCancel,
    };
