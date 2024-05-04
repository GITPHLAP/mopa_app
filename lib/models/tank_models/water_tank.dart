import 'package:mopa_app/enums/positions.dart';
import 'package:mopa_app/enums/tank_types.dart';
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