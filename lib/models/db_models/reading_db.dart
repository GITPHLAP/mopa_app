import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class ReadingDB {
  int? id;
  String tankType;
  String tankPosition;
  double value;

  ReadingDB(this.id, this.tankPosition, this.tankType, this.value);

  Reading toDTOReading(Ship voyagerShip) {
    return Reading(
        id: id,
        tank: Tank.getShipTankBy(voyagerShip, tankType, tankPosition),
        value: value);
  }
}
