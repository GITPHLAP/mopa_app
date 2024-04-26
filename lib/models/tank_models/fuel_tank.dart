import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class FuelTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.fuel;

  @override
  Positions position;

  FuelTank(this.position, this.limit);
}