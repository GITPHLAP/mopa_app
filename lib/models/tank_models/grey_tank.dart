import 'package:mopa_app/models/tank_models/tank.dart';

import '../../enums/positions.dart';
import '../../enums/tank_types.dart';

class GreyTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.grey;

  @override
  Positions position;

  GreyTank(this.position, this.limit);
}