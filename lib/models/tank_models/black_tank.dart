import 'package:mopa_app/models/tank_models/tank.dart';

import '../../enums/positions.dart';
import '../../enums/tank_types.dart';

class BlackTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.black;

  @override
  Positions position;

  BlackTank(this.position, this.limit);
}
