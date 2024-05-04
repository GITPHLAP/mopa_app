import 'package:mopa_app/enums/positions.dart';
import 'package:mopa_app/enums/tank_types.dart';
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
