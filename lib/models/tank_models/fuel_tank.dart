import 'package:mopa_app/models/tank_models/tank.dart';

import '../../enums/positions.dart';
import '../../enums/tank_types.dart';

class FuelTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.fuel;

  @override
  Positions position;

  FuelTank(this.position, this.limit);
}
