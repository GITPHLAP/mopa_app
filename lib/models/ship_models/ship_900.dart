import 'package:mopa_app/models/tank_models/black_tank.dart';
import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/tank_models/fuel_tank.dart';
import 'package:mopa_app/models/tank_models/grey_tank.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/models/tank_models/water_tank.dart';

class Ship900 implements Ship{
  final List<Tank> _tanks = [];
  @override
  List<Tank> get tanks => _tanks;

  Ship900() {
    _tanks.add(WaterTank(Positions.forpeek, 1000));
    _tanks.add(WaterTank(Positions.sb, 1000.2));
    _tanks.add(WaterTank(Positions.bb, 1000.2));
    _tanks.add(FuelTank(Positions.dagtank, 1000.2));
    _tanks.add(FuelTank(Positions.sb, 1000.2));
    _tanks.add(FuelTank(Positions.bb, 1000.2));
    _tanks.add(GreyTank(Positions.sb, 1000.2));
    _tanks.add(BlackTank(Positions.bb, 1000.2));
  }
}