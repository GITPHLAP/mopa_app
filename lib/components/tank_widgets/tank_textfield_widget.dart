import 'package:flutter/material.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

class TankTextFieldWidget extends StatefulWidget {
  const TankTextFieldWidget(
      {super.key, required this.onChanged, required this.tank});

  final Function(String val, Tank tank) onChanged;
  final Tank tank;

  @override
  State<TankTextFieldWidget> createState() => _TankTextFieldWidgetState();
}

class _TankTextFieldWidgetState extends State<TankTextFieldWidget> {
  String? _textFieldErrorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (isTextFieldValid(value, widget.tank)) {
          setState(() {
            _textFieldErrorText = null;
          });

          widget.onChanged(value, widget.tank);
          return;
        }
        setState(() {
          _textFieldErrorText = "Above limit: ${widget.tank.limit}";
        });
      },
      decoration: InputDecoration(
          label: Row(
            children: [
              widget.tank.type.icon, // Icon
              const Flexible(child: FractionallySizedBox(widthFactor: 0.05)),
              Text(widget.tank.position.name), // Name
            ],
          ),
          errorText: _textFieldErrorText),
      keyboardType: TextInputType.number,
      validator: (value) => _textFieldErrorText,
    );
  }

  /// Check if the input is less the tank limit
  bool isTextFieldValid(String value, Tank fieldTank) {
    double? readingValue = double.tryParse(value);
    readingValue ??= 0;

    return fieldTank.limit >= readingValue;
  }
}
