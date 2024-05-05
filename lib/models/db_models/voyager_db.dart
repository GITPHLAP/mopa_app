import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/voyager.dart';

class VoyagerDB {
  int? id;
  int peopleCount;
  String shipType;
  bool isEnded = false;

  VoyagerDB(this.id, this.peopleCount, this.shipType, this.isEnded);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'people_count': peopleCount,
      'ship_type': shipType,
      'is_ended': isEnded
    };
  }

  static VoyagerDB fromMap(Map map) {
    VoyagerDB voyager = VoyagerDB(
        map['id'], map['people_count'], map['ship_type'], map['is_ended']);
    return voyager;
  }

  Voyager toDTOVoyager() {
    return Voyager(
        id: id, peopleCount: peopleCount, ship: Ship.getShipFromType(shipType));
  }

  static VoyagerDB fromDTOVoyager(Voyager voyager) {
    return VoyagerDB(voyager.id, voyager.peopleCount,
        Ship.getShipType(voyager.ship).name, voyager.isEnded());
  }
}
