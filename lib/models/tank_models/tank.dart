import 'package:mopa_app/enums/positions.dart';
import 'package:mopa_app/enums/tank_types.dart';
import 'package:mopa_app/models/ship_models/ship.dart';

abstract class Tank {
  abstract final TankTypes type;
  abstract double limit;
  abstract Positions position;

  static Tank getShipTankBy(Ship ship, String type, String position) {
    return ship.tanks.singleWhere(
        (t) => t.type.toString() == type && t.position.toString() == position);
  }
}
