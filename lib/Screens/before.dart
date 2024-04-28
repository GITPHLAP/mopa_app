import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/models/components/tank_list.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_provider.dart';

import '../enums/tank_types.dart';

class BeforeWidget extends ConsumerStatefulWidget {
  const BeforeWidget({super.key});

  @override
  ConsumerState<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends ConsumerState<BeforeWidget> {
  @override
  Widget build(BuildContext context) {
    final ship = ref.watch(getShipProvider);

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
                TankList(
                  ship.tanks
                      .where((element) => element.type == TankTypes.water)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(
                  width: 10,
                ),
                TankList(
                  ship.tanks
                      .where((element) =>
                          element.type == TankTypes.black ||
                          element.type == TankTypes.grey)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(
                  width: 10,
                ),
                TankList(
                  ship.tanks
                      .where((element) => element.type == TankTypes.fuel)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          // Calculation part
          const Expanded(child: Text("data")),
        ],
      ),
    );
  }

  /// Used to add a before reading when textField change
  void onReadingChanged(String val, Tank tank) {
    double? readingValue = double.tryParse(val);
    // TODO: Add validation on text field 
    // if value is null do nothing
    if (readingValue == null) {
      return;
    }

    Reading newReading = Reading(tank, readingValue);
    ref.read(voyagerNotifierProvider.notifier).addBeforeReading(newReading);
  }
}
