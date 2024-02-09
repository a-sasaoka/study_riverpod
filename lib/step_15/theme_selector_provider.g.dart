// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_selector_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeSelectorHash() => r'd7be6ecbb7fd7ba72c1b2a4b9ad16fb54907743d';

/// 選択されたテーマを管理するProvider
///
/// Copied from [ThemeSelector].
@ProviderFor(ThemeSelector)
final themeSelectorProvider =
    NotifierProvider<ThemeSelector, ThemeMode>.internal(
  ThemeSelector.new,
  name: r'themeSelectorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeSelectorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeSelector = Notifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
