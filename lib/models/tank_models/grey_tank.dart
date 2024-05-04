import 'package:mopa_app/enums/positions.dart';
import 'package:mopa_app/enums/tank_types.dart';
import 'package:mopa_app/models/tank_models/tank.dart';


class GreyTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.grey;

  @override
  Positions position;

  GreyTank(this.position, this.limit);
}