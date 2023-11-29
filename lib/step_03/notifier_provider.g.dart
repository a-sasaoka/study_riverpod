// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncCounterHash() => r'd5c43cbfdccf7219769cc53b8c6b2b7801de8b88';

/// カウント数を管理する
///
/// Copied from [AsyncCounter].
@ProviderFor(AsyncCounter)
final asyncCounterProvider =
    AutoDisposeAsyncNotifierProvider<AsyncCounter, int>.internal(
  AsyncCounter.new,
  name: r'asyncCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncCounter = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
