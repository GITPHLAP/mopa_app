import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/ship_models/ship_800.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:mopa_app/models/voyager_manager.dart';
import 'package:mopa_app/provider/voyager_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voyager_manager_provider.g.dart';

@riverpod
class VoyagerManagerNotifier extends _$VoyagerManagerNotifier {
  @override
  VoyagerManager build() {
    Future.delayed(const Duration(seconds: 2), _initialVoyager);
    return VoyagerManager(Voyager(peopleCount: 12, ship: Ship900()));
  }

  Future<void> _initialVoyager() async {
    // Try fetching voyager from local storage
    ref
        .watch(voyagerRepositoryProvider)
        .getLastUnfinishedVoyager()
        .then((value) {
      if (value != null) {
        state = state.copyWith.voyager(
          id: value.id,
          peopleCount: value.peopleCount,
          ship: value.ship,
          beforeReadings: value.beforeReadings,
          afterReadings: value.afterReadings,
        );
      }
    }).catchError((e) => print(e));
  }

  void changeAmountOfPersons(int personCount) {
    state = state.copyWith.voyager(peopleCount: personCount);
  }

  void changeShip(ShipTypes shipType) {
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
    state = state.copyWith.voyager(
        ship: ship,
        afterReadings: const IList.empty(),
        beforeReadings: const IList.empty());
  }

  void addBeforeReading(Reading reading) {
    int indexOfElement = state.voyager.beforeReadings
        .indexWhere((element) => element.tank == reading.tank);
    if (indexOfElement == -1) {
      state = state.copyWith
          .voyager(beforeReadings: state.voyager.beforeReadings.add(reading));
      return;
    }
    state = state.copyWith.voyager(
        beforeReadings:
            state.voyager.beforeReadings.replace(indexOfElement, reading));

    return;
  }

  void addAfterReading(Reading reading) {
    int indexOfElement = state.voyager.afterReadings
        .indexWhere((element) => element.tank == reading.tank);
    if (indexOfElement == -1) {
      state = state.copyWith
          .voyager(afterReadings: state.voyager.afterReadings.add(reading));
      return;
    }
    state = state.copyWith.voyager(
        afterReadings:
            state.voyager.afterReadings.replace(indexOfElement, reading));
    return;
  }
}

@riverpod
Ship getShip(ref) {
  final VoyagerManager voyagerManager =
      ref.watch(voyagerManagerNotifierProvider);

  return voyagerManager.voyager.ship;
}

@riverpod
ShipTypes getShipType(ref) {
  final VoyagerManager voyagerManager =
      ref.watch(voyagerManagerNotifierProvider);
  if (voyagerManager.voyager.ship is Ship800) {
    return ShipTypes.class800;
  }
  return ShipTypes.class900;
}

@riverpod
Voyager getVoyager(ref) {
  final VoyagerManager voyagerManager =
      ref.watch(voyagerManagerNotifierProvider);
  return voyagerManager.voyager;
}
