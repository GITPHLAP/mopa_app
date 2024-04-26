import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class BlackTank implements Tank {
  @override
  double limit;

  @override
  final TankTypes type = TankTypes.black;

  @override
  Positions position;

  BlackTank(this.position, this.limit);
}