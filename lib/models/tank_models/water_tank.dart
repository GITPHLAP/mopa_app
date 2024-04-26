import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class WaterTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.water;

  @override
  Positions position;

  WaterTank(this.position, this.limit);

}