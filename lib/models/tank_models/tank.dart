import 'package:mopa_app/enums/positions.dart';
import 'package:mopa_app/enums/tank_types.dart';

abstract class Tank {
  abstract final TankTypes type; 
  abstract double limit;
  abstract Positions position;
}