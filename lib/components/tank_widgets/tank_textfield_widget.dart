import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';

class TankTextFieldWidget extends ConsumerStatefulWidget {
  const TankTextFieldWidget(
      {super.key,
      required this.onChanged,
      required this.tank,
      required this.isAfterReading});

  final Function(String val, Tank tank) onChanged;
  final Tank tank;
  final bool isAfterReading;

  @override
  ConsumerState<TankTextFieldWidget> createState() =>
      _TankTextFieldWidgetState();
}

class _TankTextFieldWidgetState extends ConsumerState<TankTextFieldWidget> {
  String? _textFieldErrorText;

  @override
  Widget build(BuildContext context) {
    final initialText = ref.read(GetReadingValueFromTankAndTypeProvider(
        widget.isAfterReading, widget.tank));
    return TextFormField(
      initialValue: initialText,
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
