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

  static ReadingDB fromDTOVoyager(Reading reading) {
    return ReadingDB(reading.id, reading.tank.position.toString(), reading.tank.type.toString(), reading.value);
  }

    Map<String, dynamic> toMap(int voyagerId) {
    return {
      'id': id,
      'voyager_id': voyagerId,
      'tank_type': tankType,
      'tank_position': tankPosition,
      'value': value
    };
  }
}
