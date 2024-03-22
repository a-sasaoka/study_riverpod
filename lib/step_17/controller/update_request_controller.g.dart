// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateRequestControllerHash() =>
    r'3afbb5e0951dfb2fb0ce43682c52fd8d067ad29e';

/// RemoteConfigからアップデート情報を取得するコントローラ
///
/// Copied from [UpdateRequestController].
@ProviderFor(UpdateRequestController)
final updateRequestControllerProvider =
    AsyncNotifierProvider<UpdateRequestController, UpdateRequestType>.internal(
  UpdateRequestController.new,
  name: r'updateRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateRequestController = AsyncNotifier<UpdateRequestType>;
String _$cancelControllerHash() => r'09595f17e82ae7f436cf948772fdb389390079d1';

/// アップデート情報のキャンセル有無を管理するコントローラ
///
/// Copied from [CancelController].
@ProviderFor(CancelController)
final cancelControllerProvider =
    NotifierProvider<CancelController, bool>.internal(
  CancelController.new,
  name: r'cancelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cancelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CancelController = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
