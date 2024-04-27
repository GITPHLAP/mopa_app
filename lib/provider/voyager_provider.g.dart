// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voyager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getShipHash() => r'a7a90e5f41497681f665f2f906fa49406331d71d';

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
String _$getShipTypeHash() => r'230deb9bd75e3e8a62ae2baf070d5928f48b842f';

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
String _$voyagerNotifierHash() => r'0d613d16b65371a93a35741defede1c54a64d3d7';

/// See also [VoyagerNotifier].
@ProviderFor(VoyagerNotifier)
final voyagerNotifierProvider =
    AutoDisposeNotifierProvider<VoyagerNotifier, Voyager>.internal(
  VoyagerNotifier.new,
  name: r'voyagerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voyagerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoyagerNotifier = AutoDisposeNotifier<Voyager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
