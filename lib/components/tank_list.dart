import 'package:flutter/material.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class TankList extends StatefulWidget {
  const TankList(
    this.tanks, {
    required this.onChanged,
    super.key,
  });

  final List<Tank> tanks;
  final Function(String val, Tank tank) onChanged;
  @override
  State<TankList> createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: widget.tanks.map((tank) {
          return TextField(
            onChanged: (value) {
              widget.onChanged(value, tank);
            },
            decoration: InputDecoration(
              label: Row(
                children: [
                  tank.type.icon, // Icon
                  const Flexible(
                      child: FractionallySizedBox(widthFactor: 0.05)),
                  Text(tank.position.name), // Name
                ],
              ),
            ),
            keyboardType: TextInputType.number,
          );
        }).toList(),
      ),
    );
  }
}
