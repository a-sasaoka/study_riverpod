// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier_provider_07.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'76b9926d7c67ec262fbc7927fb2b5c9d83154952';

/// カウント数を管理する
///
/// Copied from [Counter].
@ProviderFor(Counter)
final counterProvider = AutoDisposeNotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = AutoDisposeNotifier<int>;
String _$userInfoHash() => r'22941ac474e0dca498f73b02618ee49c54425bb2';

/// ユーザ情報を管理する
///
/// Copied from [UserInfo].
@ProviderFor(UserInfo)
final userInfoProvider = AutoDisposeNotifierProvider<UserInfo, User>.internal(
  UserInfo.new,
  name: r'userInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserInfo = AutoDisposeNotifier<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
