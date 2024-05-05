import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/models/ship_models/ship_800.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

abstract class Ship {
  List<Tank> get tanks;

  static Ship getShipFromType(String typeName) {
    switch (typeName) {
      case "800":
        return Ship800();
      case "900":
        return Ship900();
      default:
        return Ship900();
    }
  }

  static ShipTypes getShipType(Ship ship) {
    if (ship is Ship800) {
      return ShipTypes.class800;
    }
    return ShipTypes.class900;
  }
}
