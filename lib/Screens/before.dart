import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mopa_app/models/components/tank_list.dart';
import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';

class BeforeWidget extends StatefulWidget {
  const BeforeWidget({super.key});

  @override
  State<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends State<BeforeWidget> {
  final Ship ship = Ship900();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Before"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) => element.type == TankTypes.water)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) =>
                        element.type == TankTypes.black ||
                        element.type == TankTypes.grey)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) => element.type == TankTypes.fuel)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const Expanded(child: Text("data")),
        ],
      ),
    );
  }
}
