import 'package:mopa_app/models/tank_models/black_tank.dart';
import 'package:mopa_app/models/tank_models/fuel_tank.dart';
import 'package:mopa_app/models/tank_models/grey_tank.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/models/tank_models/water_tank.dart';

import '../../enums/positions.dart';

class Ship900 implements Ship{
  final List<Tank> _tanks = [];
  @override
  List<Tank> get tanks => _tanks;

  Ship900() {
    _tanks.add(WaterTank(Positions.forepeak, 2000));
    _tanks.add(WaterTank(Positions.starboard, 3000));
    _tanks.add(WaterTank(Positions.portside, 3000));
    _tanks.add(FuelTank(Positions.daytank, 3000));
    _tanks.add(FuelTank(Positions.starboard, 3000));
    _tanks.add(FuelTank(Positions.portside, 3000));
    _tanks.add(GreyTank(Positions.starboard, 2000));
    _tanks.add(BlackTank(Positions.portside, 2000));
  }
}