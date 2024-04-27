import 'package:mopa_app/models/tank_models/tank.dart';

import '../../enums/positions.dart';
import '../../enums/tank_types.dart';

class WaterTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.water;

  @override
  Positions position;

  WaterTank(this.position, this.limit);

}