import 'package:flutter/material.dart';
import 'package:mopa_app/models/components/tank_list.dart';
import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
class BeforeWidget extends StatefulWidget {
  const BeforeWidget( {super.key});

  @override
  State<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends State<BeforeWidget> {
  final Ship ship = Ship900();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 10,),
        TankList(ship.tanks.where((element) => element.type == TankTypes.water).toList()),
        const SizedBox(height: 10,),
        TankList(ship.tanks.where((element) => element.type == TankTypes.black || element.type == TankTypes.grey).toList()),
        const SizedBox(height: 10,),
        TankList(ship.tanks.where((element) => element.type == TankTypes.fuel).toList())
      ],
    );
  }
}