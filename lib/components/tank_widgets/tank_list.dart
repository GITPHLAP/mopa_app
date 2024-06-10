import 'package:flutter/material.dart';
import 'package:mopa_app/components/tank_widgets/tank_textfield_widget.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class TankList extends StatefulWidget {
  const TankList(
    this.tanks, {
    required this.onChanged,
    required this.isAfterReading,
    super.key,
  });

  final List<Tank> tanks;
  final Function(String val, Tank tank) onChanged;
  final bool isAfterReading;
  @override
  State<TankList> createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: widget.tanks.map((tank) {
          return TankTextFieldWidget(
            onChanged: widget.onChanged,
            tank: tank,
            isAfterReading: widget.isAfterReading,
          );
        }).toList(),
      ),
    );
  }
}
