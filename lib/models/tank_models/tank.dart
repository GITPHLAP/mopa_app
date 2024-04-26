import 'package:mopa_app/models/enums.dart';

abstract class Tank {
  abstract final TankTypes type; 
  abstract double limit;
  abstract Positions position;
}