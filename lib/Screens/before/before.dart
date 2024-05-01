import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/Screens/before/calculations.dart';
import 'package:mopa_app/components/tank_list.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/utility/values.dart';

import '../../enums/tank_types.dart';

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
        title: const Text(beforePageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: defaultSpace),
                TankList(
                  ship.tanks
                      .where((element) => element.type == TankTypes.water)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(width: defaultSpace),
                TankList(
                  ship.tanks
                      .where((element) =>
                          element.type == TankTypes.black ||
                          element.type == TankTypes.grey)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(width: defaultSpace),
                TankList(
                  ship.tanks
                      .where((element) => element.type == TankTypes.fuel)
                      .toList(),
                  onChanged: onReadingChanged,
                ),
                const SizedBox(width: defaultSpace),
              ],
            ),
          ),
          // Calculation part
          const Expanded(
            child: BeforeCalculation(),
          ),
        ],
      ),
    );
  }

  /// Used to add and update a before reading when textField change
  void onReadingChanged(String val, Tank tank) {
    double? readingValue = double.tryParse(val);
    // TODO: Add validation on text field
    readingValue ??= 0;

    Reading newReading = Reading(tank: tank, value: readingValue);
    ref.read(voyagerManagerNotifierProvider.notifier).addBeforeReading(newReading);
  }
}
