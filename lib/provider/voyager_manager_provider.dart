import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/ship_models/ship_800.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:mopa_app/models/voyager_manager.dart';
import 'package:mopa_app/provider/voyager_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voyager_manager_provider.g.dart';

@riverpod
class VoyagerManagerNotifier extends _$VoyagerManagerNotifier {
  @override
  FutureOr<VoyagerManager> build() async {
    var voyager = await _initialVoyager();
    return VoyagerManager(voyager);
  }

  Future<Voyager> _initialVoyager() async {
    // Try fetching voyager from local storage
    return await ref
        .watch(voyagerRepositoryProvider)
        .getLastUnfinishedVoyager();
  }

  void changeAmountOfPersons(int personCount) {
    update((data) => data.copyWith.voyager(peopleCount: personCount));
  }

  Future<void> changeShip(ShipTypes shipType) async {
    Ship ship;
    switch (shipType) {
      case ShipTypes.class900:
        ship = Ship900();
        break;
      case ShipTypes.class800:
        ship = Ship800();
        break;
      default:
        ship = Ship900();
        break;
    }
    // When changing ship its need to reset readings, because tanks is not equal.
    update((data) => data.copyWith.voyager(
        ship: ship,
        afterReadings: const IList.empty(),
        beforeReadings: const IList.empty()));
  }

  void addBeforeReading(Reading reading) {
    int indexOfElement = state.value!.voyager.beforeReadings
        .indexWhere((element) => element.tank == reading.tank);
    if (indexOfElement == -1) {
      update((data) => data.copyWith
          .voyager(beforeReadings: data.voyager.beforeReadings.add(reading)));
      return;
    }
    update((data) => data.copyWith.voyager(
        beforeReadings:
            data.voyager.beforeReadings.replace(indexOfElement, reading)));

    return;
  }

  void addAfterReading(Reading reading) {
    int indexOfElement = state.value!.voyager.afterReadings
        .indexWhere((element) => element.tank == reading.tank);
    if (indexOfElement == -1) {
      update((data) => data.copyWith
          .voyager(afterReadings: data.voyager.afterReadings.add(reading)));
      return;
    }
    update((data) => data.copyWith.voyager(
        afterReadings:
            data.voyager.afterReadings.replace(indexOfElement, reading)));
    return;
  }

  void saveVoyager([Voyager? voyager]) {
    voyager ??= state.value!.voyager;
    ref.watch(voyagerRepositoryProvider).saveVoyager(voyager);
  }

  void newVoyager([Voyager? voyager]) {
    update((data) => data.copyWith(voyager: Voyager(peopleCount: 22, ship: Ship900())));
  }
  void clearDB() {
    ref.watch(voyagerRepositoryProvider).clearEverything();
  }
}

@riverpod
Ship getShip(GetShipRef ref) {
  final asyncVMProvicer = ref.watch(voyagerManagerNotifierProvider);
  VoyagerManager voyagerManager = asyncVMProvicer.requireValue;

  return voyagerManager.voyager.ship;
}

@riverpod
ShipTypes getShipType(GetShipTypeRef ref) {
  final asyncVMProvicer = ref.watch(voyagerManagerNotifierProvider);
  VoyagerManager voyagerManager = asyncVMProvicer.value!;

  if (voyagerManager.voyager.ship is Ship800) {
    return ShipTypes.class800;
  }
  return ShipTypes.class900;
}

@riverpod
Voyager getVoyager(GetVoyagerRef ref) {
  final asyncVMProvicer = ref.watch(voyagerManagerNotifierProvider);
  VoyagerManager voyagerManager = asyncVMProvicer.value!;

  return voyagerManager.voyager;
}

@riverpod
String getReadingValueFromTankAndType(
    GetReadingValueFromTankAndTypeRef ref, bool isAfterReading, Tank tank) {
  final asyncVMProvicer = ref.watch(voyagerManagerNotifierProvider);
  VoyagerManager voyagerManager = asyncVMProvicer.value!;

  if (isAfterReading) {
    int indexOfElement = voyagerManager.voyager.afterReadings
        .indexWhere((element) => element.tank == tank);
    return indexOfElement == -1
        ? ""
        : voyagerManager.voyager.afterReadings[indexOfElement].value.toString();
  }
  int indexOfElement = voyagerManager.voyager.beforeReadings
      .indexWhere((element) => element.tank == tank);
  return indexOfElement == -1
      ? ""
      : voyagerManager.voyager.beforeReadings[indexOfElement].value.toString();
}
