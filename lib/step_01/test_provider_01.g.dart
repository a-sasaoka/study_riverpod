// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_provider_01.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$titleHash() => r'62e203906aeaad75626fba8dae7a1eea0b1a33b8';

/// 引数無しの一番シンプルなケース
///
/// Copied from [title].
@ProviderFor(title)
final titleProvider = AutoDisposeProvider<String>.internal(
  title,
  name: r'titleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$titleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TitleRef = AutoDisposeProviderRef<String>;
String _$labelHash() => r'b404ed137fe622ae0077c6d7c08e86e562934650';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 引数ありのケース
///
/// Copied from [label].
@ProviderFor(label)
const labelProvider = LabelFamily();

/// 引数ありのケース
///
/// Copied from [label].
class LabelFamily extends Family<String> {
  /// 引数ありのケース
  ///
  /// Copied from [label].
  const LabelFamily();

  /// 引数ありのケース
  ///
  /// Copied from [label].
  LabelProvider call({
    required String str1,
    int num = 1,
  }) {
    return LabelProvider(
      str1: str1,
      num: num,
    );
  }

  @override
  LabelProvider getProviderOverride(
    covariant LabelProvider provider,
  ) {
    return call(
      str1: provider.str1,
      num: provider.num,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'labelProvider';
}

/// 引数ありのケース
///
/// Copied from [label].
class LabelProvider extends AutoDisposeProvider<String> {
  /// 引数ありのケース
  ///
  /// Copied from [label].
  LabelProvider({
    required String str1,
    int num = 1,
  }) : this._internal(
          (ref) => label(
            ref as LabelRef,
            str1: str1,
            num: num,
          ),
          from: labelProvider,
          name: r'labelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$labelHash,
          dependencies: LabelFamily._dependencies,
          allTransitiveDependencies: LabelFamily._allTransitiveDependencies,
          str1: str1,
          num: num,
        );

  LabelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.str1,
    required this.num,
  }) : super.internal();

  final String str1;
  final int num;

  @override
  Override overrideWith(
    String Function(LabelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LabelProvider._internal(
        (ref) => create(ref as LabelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        str1: str1,
        num: num,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _LabelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LabelProvider && other.str1 == str1 && other.num == num;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, str1.hashCode);
    hash = _SystemHash.combine(hash, num.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LabelRef on AutoDisposeProviderRef<String> {
  /// The parameter `str1` of this provider.
  String get str1;

  /// The parameter `num` of this provider.
  int get num;
}

class _LabelProviderElement extends AutoDisposeProviderElement<String>
    with LabelRef {
  _LabelProviderElement(super.provider);

  @override
  String get str1 => (origin as LabelProvider).str1;
  @override
  int get num => (origin as LabelProvider).num;
}

String _$nameHash() => r'8d07ee2873c80c6eddfc9eac552da008ac07ae96';

/// 非同期処理のケース
///
/// Copied from [name].
@ProviderFor(name)
final nameProvider = AutoDisposeFutureProvider<String>.internal(
  name,
  name: r'nameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NameRef = AutoDisposeFutureProviderRef<String>;
String _$countHash() => r'15bf842f9a0e1fd1e92a757142e3cbaf3fc71c22';

/// Streamのケース
///
/// Copied from [count].
@ProviderFor(count)
final countProvider = AutoDisposeStreamProvider<String>.internal(
  count,
  name: r'countProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountRef = AutoDisposeStreamProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
