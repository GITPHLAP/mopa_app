import '../../enums/positions.dart';
import '../../enums/tank_types.dart';

abstract class Tank {
  abstract final TankTypes type; 
  abstract double limit;
  abstract Positions position;
}