import 'package:flutter/material.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class TankList extends StatefulWidget {
  const TankList(
    this.tanks, {
    super.key,
  });

  final List<Tank> tanks;

  @override
  State<TankList> createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          for (Tank tank in widget.tanks)
            Expanded(
              child: Row(
                children: [
                  tank.type.icon,
                  const SizedBox(width: 10),
                  Text(tank.position.name),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(label: Text("Reading")),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
