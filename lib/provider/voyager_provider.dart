import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/ship_models/ship_800.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voyager_provider.g.dart';

@riverpod
class VoyagerNotifier extends _$VoyagerNotifier {
  @override
  Voyager build() {
    return Voyager(12, Ship900());
  }

  void changeAmountOfPersons(int personCount) {
    state = Voyager(personCount, state.ship);
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
    state = Voyager(state.peopleCount, ship);
  }
}

// final voyagerNotifierProvider = NotifierProvider<VoyagerNotifier, Voyager>(() {
//   return VoyagerNotifier();
// });

@riverpod
Ship getShip(ref) {
  final voyager = ref.watch(voyagerNotifierProvider);

  return voyager.ship;
}

@riverpod
ShipTypes getShipType(ref) {
  final voyager = ref.watch(voyagerNotifierProvider);
  if(voyager.ship is Ship800 ) {
    return ShipTypes.class800;
  }
  return ShipTypes.class900;
}
