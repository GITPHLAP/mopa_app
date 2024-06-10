// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voyager_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getShipHash() => r'45d0464eec1c8a61fe91a43db3e530c4fb1d7229';

/// See also [getShip].
@ProviderFor(getShip)
final getShipProvider = AutoDisposeProvider<Ship>.internal(
  getShip,
  name: r'getShipProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getShipHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetShipRef = AutoDisposeProviderRef<Ship>;
String _$getShipTypeHash() => r'0da25ec7a4815d38b705c2e190a5fd2bbef8d502';

/// See also [getShipType].
@ProviderFor(getShipType)
final getShipTypeProvider = AutoDisposeProvider<ShipTypes>.internal(
  getShipType,
  name: r'getShipTypeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getShipTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetShipTypeRef = AutoDisposeProviderRef<ShipTypes>;
String _$getVoyagerHash() => r'7429bd890c36be4d6b7dd12950b087cc6fc14ca7';

/// See also [getVoyager].
@ProviderFor(getVoyager)
final getVoyagerProvider = AutoDisposeProvider<Voyager>.internal(
  getVoyager,
  name: r'getVoyagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getVoyagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVoyagerRef = AutoDisposeProviderRef<Voyager>;
String _$getReadingValueFromTankAndTypeHash() =>
    r'60c183985c801a8a4a636c92a67d4ae5b3c41dd3';

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

/// See also [getReadingValueFromTankAndType].
@ProviderFor(getReadingValueFromTankAndType)
const getReadingValueFromTankAndTypeProvider =
    GetReadingValueFromTankAndTypeFamily();

/// See also [getReadingValueFromTankAndType].
class GetReadingValueFromTankAndTypeFamily extends Family<String> {
  /// See also [getReadingValueFromTankAndType].
  const GetReadingValueFromTankAndTypeFamily();

  /// See also [getReadingValueFromTankAndType].
  GetReadingValueFromTankAndTypeProvider call(
    bool isAfterReading,
    Tank tank,
  ) {
    return GetReadingValueFromTankAndTypeProvider(
      isAfterReading,
      tank,
    );
  }

  @override
  GetReadingValueFromTankAndTypeProvider getProviderOverride(
    covariant GetReadingValueFromTankAndTypeProvider provider,
  ) {
    return call(
      provider.isAfterReading,
      provider.tank,
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
  String? get name => r'getReadingValueFromTankAndTypeProvider';
}

/// See also [getReadingValueFromTankAndType].
class GetReadingValueFromTankAndTypeProvider
    extends AutoDisposeProvider<String> {
  /// See also [getReadingValueFromTankAndType].
  GetReadingValueFromTankAndTypeProvider(
    bool isAfterReading,
    Tank tank,
  ) : this._internal(
          (ref) => getReadingValueFromTankAndType(
            ref as GetReadingValueFromTankAndTypeRef,
            isAfterReading,
            tank,
          ),
          from: getReadingValueFromTankAndTypeProvider,
          name: r'getReadingValueFromTankAndTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getReadingValueFromTankAndTypeHash,
          dependencies: GetReadingValueFromTankAndTypeFamily._dependencies,
          allTransitiveDependencies:
              GetReadingValueFromTankAndTypeFamily._allTransitiveDependencies,
          isAfterReading: isAfterReading,
          tank: tank,
        );

  GetReadingValueFromTankAndTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isAfterReading,
    required this.tank,
  }) : super.internal();

  final bool isAfterReading;
  final Tank tank;

  @override
  Override overrideWith(
    String Function(GetReadingValueFromTankAndTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetReadingValueFromTankAndTypeProvider._internal(
        (ref) => create(ref as GetReadingValueFromTankAndTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isAfterReading: isAfterReading,
        tank: tank,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _GetReadingValueFromTankAndTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetReadingValueFromTankAndTypeProvider &&
        other.isAfterReading == isAfterReading &&
        other.tank == tank;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isAfterReading.hashCode);
    hash = _SystemHash.combine(hash, tank.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetReadingValueFromTankAndTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `isAfterReading` of this provider.
  bool get isAfterReading;

  /// The parameter `tank` of this provider.
  Tank get tank;
}

class _GetReadingValueFromTankAndTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with GetReadingValueFromTankAndTypeRef {
  _GetReadingValueFromTankAndTypeProviderElement(super.provider);

  @override
  bool get isAfterReading =>
      (origin as GetReadingValueFromTankAndTypeProvider).isAfterReading;
  @override
  Tank get tank => (origin as GetReadingValueFromTankAndTypeProvider).tank;
}

String _$voyagerManagerNotifierHash() =>
    r'64ca7f49f50497bb1d6995bc23d8034ff1b8c2f7';

/// See also [VoyagerManagerNotifier].
@ProviderFor(VoyagerManagerNotifier)
final voyagerManagerNotifierProvider = AutoDisposeAsyncNotifierProvider<
    VoyagerManagerNotifier, VoyagerManager>.internal(
  VoyagerManagerNotifier.new,
  name: r'voyagerManagerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voyagerManagerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoyagerManagerNotifier = AutoDisposeAsyncNotifier<VoyagerManager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
